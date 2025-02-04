import 'package:news_app/models/SourceResponse.dart';

abstract class SourceLocalDataSource{
  Future<SourceResponse?> getSources(String categoryId);
  void saveSources(SourceResponse? sourceResponse, String categoryId);
}