import 'package:flutter/cupertino.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier{
  //TODO: Hold data & Handle logic
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async{
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message!;
      } else {
        newsList = response!.articles!;
      }
    }catch(e){
      errorMessage = 'Something Went Wrong';
    }
    notifyListeners();
  }
}
