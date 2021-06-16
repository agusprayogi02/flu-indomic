import 'package:get/get_connect/connect.dart';
import 'package:indomic/data/models/chapter_model.dart';
import 'package:indomic/data/services/http_client.dart';

class ChapterApi extends HttpGetClient {
  Future<ChapterModel> getChapter(String chapter) async {
    var index = 3, pages;
    Response response;
    // menggulang jika chapter pages = 0
    do {
      response = await getRequest("chapter/" + chapter);
      pages = response.body["chapter_pages"];
      index--;
    } while (index >= 1 && pages == 0);
    var list = ChapterModel.fromJson(response.body);
    return list;
  }
}
