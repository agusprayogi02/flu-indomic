import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/provider/thumbnail_api.dart';

class ThumbnailRepository {
  final ThumbnailApi api;

  ThumbnailRepository({required this.api});

  Future<List<ThumbMangaList>> getAll() async {
    return await api.getLatestUpdate();
  }
}
