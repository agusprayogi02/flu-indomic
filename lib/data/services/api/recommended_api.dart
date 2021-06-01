import 'package:get/get_connect/connect.dart';
import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/ui/utils/utils.dart';

class RecommendedApi extends GetConnect {
  Future<MangaList> getRecommended() async {
    var response = await get(BASE_URL + 'recommended');
    bool status = response.body('status');
    var list = response.body('manga_list');
    if (!status) {
      throw Error();
    }
    return MangaList.fromJson(list);
  }
}
