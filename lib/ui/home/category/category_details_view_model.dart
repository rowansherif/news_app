import 'package:flutter/cupertino.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  //TODO: hold data & handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        errorMessage = response!.message!;
      } else {
        sourcesList = response!.sources!;
      }
    }catch(e){
      errorMessage = 'Something Went Wrong';
    }
    notifyListeners();
  }
}