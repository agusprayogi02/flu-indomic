import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/api_exception.dart';
import 'package:indomic/data/services/http_client.dart';

class ThumbnailApi extends HttpGetClient {
// Get request
  Future<List<ThumbMangaList>> getLatestUpdate(int index) async {
    var response = await getRequest("manga/page/$index");
    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      throw EmptyResultException();
    }
    return list.mangaList!;
  }

  Future<List<ThumbMangaList>> getSearch(String args) async {
    var response = await getRequest('search/' + args);

    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      throw EmptyResultException();
    }
    return list.mangaList!;
  }

  Future<List<ThumbMangaList>> getManhua(int index) async {
    var response = await getRequest("manhua/$index");

    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      throw EmptyResultException();
    }
    return list.mangaList!;
  }

  Future<List<ThumbMangaList>> getManhwa(int index) async {
    var response = await getRequest("manhwa/$index");

    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      throw EmptyResultException();
    }
    return list.mangaList!;
  }
}
