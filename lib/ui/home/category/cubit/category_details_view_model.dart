import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/source/dataSources/source_remote_data_source.dart';
import 'package:news_app/repository/source/dataSources/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import 'package:news_app/ui/home/category/cubit/sources_states.dart';

class CategoryDetailsViewModel extends Cubit<SourcesState>{
  SourceRepository sourceRepository;

  CategoryDetailsViewModel({required this.sourceRepository}):super(SourceLoadingState());

  //TODO: hold data & handle logic
  int selectedIndex = 0;

  void getSources(String categoryId)async{
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
      if(response!.status == 'error'){
        emit(SourceErrorState(errorMessage: response.message!));
      }else{
        emit(SourceSuccessState(sourcesList: response.sources!));
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

  void changeSelectedIndex(int newIndex){
    selectedIndex = newIndex;
    emit(ChangeSelectedIndex());
    print("selected index = $selectedIndex");
  }
}