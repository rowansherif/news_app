import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/repository/news/dataSource/News_remote_data_source.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}