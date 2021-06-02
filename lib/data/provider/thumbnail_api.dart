import 'package:get/get.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/ui/utils/utils.dart';

class ThumbnailApi extends GetConnect {
// Get request
  Future<List<MangaList>> getLatestUpdate({int index = 1}) async {
    var response = await get(BASE_URL + "manga/page/$index");
    var list = ThumbnailModel.fromJson(response.body);
    if (response.status.hasError) {
      throw Error();
    }
    return list.mangaList!;
  }
}
