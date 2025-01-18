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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
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
                  Text('Something went wrong'),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }
          //TODO: success server response
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemCount: newsList.length,
              itemBuilder: (context, index){
                return NewsItem(news: newsList[index]);
              });
        });
  }
}
