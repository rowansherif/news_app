import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repository/source/dataSources/source_local_data_source.dart';

@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    // TODO: get sources => read data
    var box = await Hive.openBox('SourceTabs');
    var sourceTab = box.get(categoryId);
    return sourceTab;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String categoryId) async{
    // TODO: save sources => write data
    var box = await Hive.openBox('SourceTabs');
    await box.put(categoryId, sourceResponse);
    await box.close();
  }

}