import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/repository/news/dataSource/News_remote_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager ;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return apiManager.getNewsBySourceId(sourceId);
  }
}