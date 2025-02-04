// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manager.dart' as _i1047;
import '../repository/news/dataSource/news_local_data_source.dart' as _i413;
import '../repository/news/dataSource/news_local_data_source_impl.dart'
    as _i819;
import '../repository/news/dataSource/news_remote_data_source.dart' as _i825;
import '../repository/news/dataSource/news_remote_data_source_impl.dart'
    as _i824;
import '../repository/news/repository/news_repository.dart' as _i251;
import '../repository/news/repository/news_repository_impl.dart' as _i941;
import '../repository/source/dataSources/source_local_data_source.dart'
    as _i987;
import '../repository/source/dataSources/source_local_data_source_impl.dart'
    as _i327;
import '../repository/source/dataSources/source_remote_data_source.dart'
    as _i918;
import '../repository/source/dataSources/source_remote_data_source_impl.dart'
    as _i919;
import '../repository/source/repository/source_repository.dart' as _i1033;
import '../repository/source/repository/source_repository_impl.dart' as _i975;
import '../ui/home/category/cubit/category_details_view_model.dart' as _i599;
import '../ui/home/news/cubit/news_view_model.dart' as _i320;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i825.NewsRemoteDataSource>(() =>
        _i824.NewsRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i413.NewsLocalDataSource>(
        () => _i819.NewsLocalDataSourceImpl());
    gh.factory<_i918.SourceRemoteDataSource>(() =>
        _i919.SourceRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i987.SourceLocalDataSource>(
        () => _i327.SourceLocalDataSourceImpl());
    gh.factory<_i251.NewsRepository>(() => _i941.NewsRepositoryImpl(
          remoteDataSource: gh<_i825.NewsRemoteDataSource>(),
          localDataSource: gh<_i413.NewsLocalDataSource>(),
        ));
    gh.factory<_i1033.SourceRepository>(() => _i975.SourceRepositoryImpl(
          remoteDataSource: gh<_i918.SourceRemoteDataSource>(),
          localDataSource: gh<_i987.SourceLocalDataSource>(),
        ));
    gh.factory<_i599.CategoryDetailsViewModel>(() =>
        _i599.CategoryDetailsViewModel(
            sourceRepository: gh<_i1033.SourceRepository>()));
    gh.factory<_i320.NewsViewModel>(
        () => _i320.NewsViewModel(newsRepository: gh<_i251.NewsRepository>()));
    return this;
  }
}
