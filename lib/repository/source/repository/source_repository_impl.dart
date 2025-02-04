import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repository/source/dataSources/source_local_data_source.dart';
import 'package:news_app/repository/source/dataSources/source_remote_data_source.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;
  SourceRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      //TODO: internet => remote data source
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      //TODO: save sources
      localDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    }else{
      //TODO: no internet => local data source
      return localDataSource.getSources(categoryId);
    }
  }
}