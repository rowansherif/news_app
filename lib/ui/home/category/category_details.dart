import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/home/category/category_details_view_model.dart';
import 'package:news_app/ui/home/category/source_tap_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child){
            if(viewModel.errorMessage != null){
              return Center(
                child: Column(
                    children : [
                      Text(viewModel.errorMessage!,
                      style: Theme.of(context).textTheme.labelMedium,),
                      ElevatedButton(
                          onPressed: (){
                            viewModel.getSources(widget.category.id);
                          },
                          child: Text('Try Again',
                            style: Theme.of(context).textTheme.labelMedium,))
                    ]
                ),
              );
            }else if(viewModel.sourcesList == null){
              return Center(child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),);
            }
            return SourceTapWidget(sourcesList: viewModel.sourcesList!);
          }),
    );
  }
}


/*
FutureBuilder<SourceResponse?>(
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
*/