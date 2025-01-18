import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/home/category/source_tap_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot){
          //TODO: loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),);
          }else if(snapshot.hasError){
            return Center(
              child: Column(
                children : [
                  Text('Something went wrong'),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getSources(widget.category.id);
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ]
              ),
            );
            //server response => success oe error
            //1- error server response
          }else if(snapshot.data!.status != 'ok'){
            return Center(
              child: Column(
                  children : [
                    Text(snapshot.data!.message!),
                    ElevatedButton(
                        onPressed: (){
                          ApiManager.getSources(widget.category.id);
                          setState(() {

                          });
                        },
                        child: Text('Try Again'))
                  ]
              ),
            );
          }
          //2- success server response
          var sourcesNamesList = snapshot.data!.sources!;
          return SourceTapWidget(sourcesList: sourcesNamesList);
        });
  }
}
