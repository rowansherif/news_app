import 'package:news_app/models/SourceResponse.dart';

abstract class SourceRepository{
  Future<SourceResponse?> getSources(String categoryId);
}