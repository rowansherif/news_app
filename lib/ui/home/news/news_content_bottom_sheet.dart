import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/news/web_view_screen.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsContentBottomSheet extends StatelessWidget {
  String newsImageUrl;
  String newsContent;
  String newsUrl;

  NewsContentBottomSheet({required this.newsImageUrl, required this.newsContent, required this.newsUrl});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;



    return Column(
      children: [
        Container(
          width: width * 0.95,
          padding: EdgeInsets.symmetric(horizontal: width * 0.023, vertical: height * 0.013),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).indicatorColor
          ),
          child: Column(
            spacing: height * 0.01,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: height * 0.25,
                  fit: BoxFit.fill,
                  imageUrl: newsImageUrl ?? '',
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(
                    color: AppColors.greyColor,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(newsContent,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewScreen(newsUrl: newsUrl), // Replace with your URL
                      ),
                    );
                  },
                  child: Text('View Full Article',
                  style: Theme.of(context).textTheme.labelLarge,)),
            ],
          ),
        ),
        SizedBox(height: height * 0.02,)
      ],
    );
  }
}
