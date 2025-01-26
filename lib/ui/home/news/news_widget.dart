import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int pageSize = 5;
  bool hasMore = true;
  var newsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager.getNewsBySourceId(widget.source.id ?? '', currentPage, pageSize );
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        ApiManager.getNewsBySourceId(widget.source.id ?? '', currentPage, pageSize );
        currentPage ++;
        setState(() {
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? '', currentPage, pageSize ),
        builder: (context, snapshot){
          //TODO: loading status
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }
          //TODO: error from me
          else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text('Something went wrong',
                  style: Theme.of(context).textTheme.headlineMedium,),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getNewsBySourceId(widget.source.id ?? '', currentPage, pageSize );
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }
          //TODO: error server response
          else if(snapshot.data!.status != 'ok'){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getNewsBySourceId(widget.source.id ?? '', currentPage, pageSize );
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }
          //TODO: success server response
          newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            controller: scrollController,
            itemCount: newsList.length+1,
              itemBuilder: (context, index){
              if(index < newsList.length){
                return NewsItem(news: newsList[index]);
              }else if(index == newsList.length+1){
                return Text('No more to load');
              }
              else{
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
                );
              }

              });
        });
  }
}
