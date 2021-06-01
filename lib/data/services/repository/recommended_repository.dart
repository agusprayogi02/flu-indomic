import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/data/services/api/recommended_api.dart';

class RecommendedRepository {
  final RecommendedApi api;

  RecommendedRepository({required this.api});

  Future<MangaList> getAll() async {
    return await api.getRecommended();
  }
}
