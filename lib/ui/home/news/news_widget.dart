import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/ui/home/news/news_widget_view_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  void didUpdateWidget(NewsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
            builder: (context, viewModel, child){
              if(viewModel.errorMessage != null){
                return Center(
                  child: Column(
                      children : [
                        Text(viewModel.errorMessage!,
                          style: Theme.of(context).textTheme.labelMedium,),
                        ElevatedButton(
                            onPressed: (){
                              viewModel.getNewsBySourceId(widget.source.id!);
                            },
                            child: Text('Try Again',
                              style: Theme.of(context).textTheme.labelMedium,))
                      ]
                  ),
                );
              }else if(viewModel.newsList == null){
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greyColor,
                  ),
                );
              }
              return ListView.builder(
                  itemCount: viewModel.newsList!.length,
                  itemBuilder: (context, index){
                    return NewsItem(news: viewModel.newsList![index]);
                  });
            }),);
  }
}


