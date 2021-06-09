import 'package:indomic/data/models/chapter_model.dart';
import 'package:indomic/data/provider/chapter_api.dart';

class ChapterRepository {
  final ChapterApi api;

  ChapterRepository({required this.api});
  Future<ChapterModel> getAll(
      {String chapter = "martial-peak-chapter-1230/"}) async {
    return await api.getChapter(chapter);
  }
}
