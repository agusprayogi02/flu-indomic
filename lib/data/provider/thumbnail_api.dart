import 'package:get/get.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/http_client.dart';

class ThumbnailApi extends GetConnect {
// Get request
  Future<List<ThumbMangaList>> getLatestUpdate(int index) async {
    var response = await HttpGetClient().getRequest("manga/page/$index");
    if (response.status.hasError) {
      throw Error();
    }
    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      throw Error();
    }
    return list.mangaList!;
  }

  Future<List<ThumbMangaList>> getSearch(String args) async {
    var response = await HttpGetClient().getRequest('search/' + args);
    if (response.status.hasError) {
      throw Error.safeToString(response.statusText);
    }
    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      print(list.mangaList!.length);
      throw Error();
    }
    return list.mangaList!;
  }

  Future<List<ThumbMangaList>> getManhua(int index) async {
    var response = await HttpGetClient().getRequest("manhua/$index");
    if (response.status.hasError) {
      throw Error();
    }
    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      throw Error();
    }
    return list.mangaList!;
  }

  Future<List<ThumbMangaList>> getManhwa(int index) async {
    var response = await HttpGetClient().getRequest("manhwa/$index");
    if (response.status.hasError) {
      throw Error();
    }
    var list = ThumbnailModel.fromJson(response.body);
    if (list.mangaList!.length <= 0) {
      throw Error();
    }
    return list.mangaList!;
  }
}
