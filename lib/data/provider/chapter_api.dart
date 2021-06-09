import 'package:get/get_connect/connect.dart';
import 'package:indomic/data/models/chapter_model.dart';
import 'package:indomic/ui/utils/utils.dart';

class ChapterApi extends GetConnect {
  Future<ChapterModel> getChapter(String chapter) async {
    var response = await get(BASE_URL + "chapter/" + chapter);
    if (response.hasError) {
      throw Error();
    }
    var list = ChapterModel.fromJson(response.body);
    return list;
  }
}
