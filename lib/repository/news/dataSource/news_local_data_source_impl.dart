import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/repository/news/dataSource/news_local_data_source.dart';

@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource{
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
    var box = await Hive.openBox('News');
    var news = await box.get(sourceId);
    return news;
  }

  @override
  void saveNews(NewsResponse? newsResponse, String sourceId) async{
    var box = await Hive.openBox('News');
    await box.put(sourceId, newsResponse);
    await box.close();
  }
  
}