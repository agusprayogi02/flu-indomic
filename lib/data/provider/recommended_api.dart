import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/data/services/http_client.dart';

class RecommendedApi extends HttpGetClient {
  Future<List<MangaList>> getRecommended() async {
    var response = await getRequest('recommended');
    var list = RecommendedModel.fromJson(response.body);
    return list.mangaList!;
  }
}
