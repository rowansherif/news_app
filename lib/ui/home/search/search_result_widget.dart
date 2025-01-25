import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/news/news_item.dart';

import '../../../utils/app_colors.dart';


class SearchResultWidget extends StatefulWidget {
  String query;

  SearchResultWidget({required this.query});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsByQuery(widget.query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong',
                    style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsByQuery(widget.query);
                      setState(() {});
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          else if(snapshot.data!.status == 'error'){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.message!,
                    style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsByQuery(widget.query);
                      setState(() {});
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          else if (snapshot.data == null || snapshot.data!.articles!.isEmpty) {
            return Center(child: Text('No results found.',
            style: Theme.of(context).textTheme.titleMedium,));
          }

          var searchList = snapshot.data?.articles ?? [];
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: searchList[index]);
            },
          );

        });
  }
}
