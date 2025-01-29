import 'package:news_app/models/NewsResponse.dart';

abstract class NewsRepository{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}