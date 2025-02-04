import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/di/di_injectable.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';
import 'package:news_app/ui/home/news/cubit/news_view_model.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = getIt<NewsViewModel>();
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
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: viewModel,
        builder: (context, state){
          if(state is NewsLoadingState){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }else if(state is NewsErrorState){
            return Center(
              child: Column(
                children: [
                  Text(state.errorMessage,
                    style: Theme.of(context).textTheme.headlineMedium,),
                  ElevatedButton(
                      onPressed: (){
                        viewModel.getNewsBySourceId(widget.source.id!);
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }else if(state is NewsSuccessState){
            return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index){
                  return NewsItem(news: state.newsList[index]);
                });
          }
          return Container();
        });
  }
}
