//TODO: we need to create an Interface for each type of data sources either online (remote) or offline (local)

import 'package:news_app/models/SourceResponse.dart';

abstract class SourceRemoteDataSource{
  Future<SourceResponse?> getSources(String categoryId);
}