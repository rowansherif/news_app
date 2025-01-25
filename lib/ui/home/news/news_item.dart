import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/ui/home/news/news_content_bottom_sheet.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        showModalBottomSheet(
            context: context, 
            builder: (BuildContext context){
              return NewsContentBottomSheet(
                  newsImageUrl: news.urlToImage ?? '',
                  newsContent: news.content ?? '',
                  newsUrl: news.url ?? '');
            });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.01,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.01
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).indicatorColor,
            width: 2,
          ),
        ),
        child: Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                width: double.infinity,
                height: height * 0.25,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              //Image.network(news.urlToImage ?? ''),
            ),
            Text(news.title ?? '',
            style: Theme.of(context).textTheme.labelLarge,),
            Row(
              children: [
                Expanded(
                  child: Text('By: ${news.author ?? ''}',
                  style: AppStyles.medium12Grey,),
                ),
                Text( timeago.format(DateTime.parse(news.publishedAt ?? '')
                  //GetTimeAgo.parse(DateTime.parse(news.publishedAt ?? '')
                  ) ,
                style: AppStyles.medium12Grey,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
