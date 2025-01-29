import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/home/category/cubit/category_details_view_model.dart';
import 'package:news_app/ui/home/category/cubit/sources_states.dart';
import 'package:news_app/ui/home/category/source_tap_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(sourceRepository: injectSourceRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<CategoryDetailsViewModel, SourcesState>(
        // bloc: viewModel,
      builder: (context, state){
        if(state is SourceLoadingState){
          return Center(child: CircularProgressIndicator(
            color: AppColors.greyColor,
          ),);
        }else if(state is SourceErrorState){
          return Center(
            child: Column(
                children : [
                  Text(state.errorMessage),
                  ElevatedButton(
                      onPressed: (){
                        viewModel.getSources(widget.category.id);
                      },
                      child: Text('Try Again'))
                ]
            ),
          );
        }else if(state is SourceSuccessState){
          return SourceTapWidget(sourcesList: state.sourcesList);
        }
        return Container();
      }),
    );
  }
}

