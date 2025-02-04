import 'package:news_app/models/NewsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}