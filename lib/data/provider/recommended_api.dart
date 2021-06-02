import 'package:get/get_connect/connect.dart';
import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/ui/utils/utils.dart';

class RecommendedApi extends GetConnect {
  Future<List<MangaList>> getRecommended() async {
    var response = await get(BASE_URL + 'recommended');
    var list = RecommendedModel.fromJson(response.body);
    if (response.status.hasError) {
      throw Error.safeToString(response.statusText);
    }
    return list.mangaList!;
  }
}
