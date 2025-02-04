import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/repository/news/dataSource/news_local_data_source.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsLocalDataSource localDataSource;
  NewsRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      //TODO: internet => remote data source
      var newsResponse = await remoteDataSource.getNewsBySourceId(sourceId);
      //TODO: save news
      localDataSource.saveNews(newsResponse, sourceId);
      return newsResponse;
    }else{
      //TODO: no internet => local data source
      return localDataSource.getNewsBySourceId(sourceId);
    }
  }
}