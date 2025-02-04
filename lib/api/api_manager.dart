import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

@singleton
class ApiManager {
  //TODO: singleton design pattern => when there are more than one class need an object from a specific class we create on object and use it instead of create new object each time
  //TODO: private constructor
  // ApiManager._();
  //
  // static ApiManager? _instance;
  //
  // static ApiManager getInstance(){
  //   _instance ??= ApiManager._();
  //   return _instance!;
  // }

  Future<SourceResponse?> getSources(String categoryId) async {
    //The code put in try catch because I might have no response if problem happened to me (like: no internet connection)
    Uri url = Uri.https(ApiConstants.serverName, EndPoints.sourcesApi,
        {'apiKey': ApiConstants.apiKey,
         'category' : categoryId});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.serverName, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      // we need the query parameter 'sources' As we need to show the news which belong to specific source
      'sources': sourceId
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

}
