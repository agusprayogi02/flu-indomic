import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/provider/thumbnail_api.dart';

class ThumbnailRepository {
  final ThumbnailApi api;

  ThumbnailRepository({required this.api});

  Future<List<ThumbMangaList>> getAll({int index = 1}) async {
    return await api.getLatestUpdate(index);
  }

  Future<List<ThumbMangaList>> getSearch({String args = ""}) async {
    print("search args: $args");
    return await api.getSearch(args);
  }

  Future<List<ThumbMangaList>> getManhua({int index = 1}) async {
    return await api.getManhua(index);
  }

  Future<List<ThumbMangaList>> getManhwa({int index = 1}) async {
    return await api.getManhwa(index);
  }
}
