import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
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

  static Future<NewsResponse?> getNewsBySourceId(String sourceId, /*int pageNum*/) async {
    Uri url = Uri.https(ApiConstants.serverName, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      // we need the query parameter 'sources' As we need to show the news which belong to specific source
      'sources': sourceId,
      //'page' : pageNum
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

  static Future<NewsResponse?> getNewsByQuery(String query, /*int pageNum*/) async {
    Uri url = Uri.https(ApiConstants.serverName, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      // we need the query parameter 'sources' As we need to show the news which belong to specific source
      'q': Uri.encodeQueryComponent(query),
      //'page' : pageNum
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
