// // SourceViewModel => object SourceRepositoryImpl as we can't create one from the abstract class so we create one from its children
// // SourceRepository => object SourceRemoteDataSourceImpl as we can't create one from the abstract class so we create one from its children
// // SourceRemoteDataSource => object ApiManager
//
// import 'package:news_app/api/api_manager.dart';
// import 'package:news_app/repository/news/dataSource/news_local_data_source.dart';
// import 'package:news_app/repository/news/dataSource/news_local_data_source_impl.dart';
// import 'package:news_app/repository/news/dataSource/news_remote_data_source.dart';
// import 'package:news_app/repository/news/dataSource/news_remote_data_source_impl.dart';
// import 'package:news_app/repository/news/repository/news_repository.dart';
// import 'package:news_app/repository/news/repository/news_repository_impl.dart';
// import 'package:news_app/repository/source/dataSources/source_local_data_source.dart';
// import 'package:news_app/repository/source/dataSources/source_local_data_source_impl.dart';
// import 'package:news_app/repository/source/dataSources/source_remote_data_source.dart';
// import 'package:news_app/repository/source/dataSources/source_remote_data_source_impl.dart';
// import 'package:news_app/repository/source/repository/source_repository.dart';
// import 'package:news_app/repository/source/repository/source_repository_impl.dart';
//
// SourceRepository injectSourceRepository(){
//   return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource(), localDataSource: injectSourceLocalDataSource());
// }
//
// SourceRemoteDataSource injectSourceRemoteDataSource(){
//   return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
//
// SourceLocalDataSource injectSourceLocalDataSource(){
//   return SourceLocalDataSourceImpl();
// }
//
//
// // NewsViewModel => object NewsRepositoryImpl as we can't create one from the abstract class so we create one from its children
// // NewsRepository => object NewsRemoteDataSourceImpl as we can't create one from the abstract class so we create one from its children
// // NewsRemoteDataSource => object ApiManager
//
// NewsRepository injectNewsRepository(){
//   return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource(), localDataSource: injectNewsLocalDataSource());
// }
//
// NewsLocalDataSource injectNewsLocalDataSource(){
//   return NewsLocalDataSourceImpl();
// }
// NewsRemoteDataSource injectNewsRemoteDataSource(){
//   return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }