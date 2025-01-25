import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  String newsUrl;

  WebViewScreen({required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(newsUrl));

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 30,
          color: Theme.of(context).indicatorColor
        ),
        title: Text('Full Article',
        style: Theme.of(context).textTheme.headlineMedium,),
        centerTitle: true,
        backgroundColor: AppColors.greyColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.06),
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
