import 'package:get/get.dart';
import 'package:indomic/data/models/chapter_model.dart';
import 'package:indomic/data/services/repository/chapter_repository.dart';

class ChapterController extends GetxController {
  static ChapterController get to => Get.find();

  final isLoading = false.obs;
  final isError = false.obs;
  final data = Rx<ChapterModel>(ChapterModel());
  final title = "".obs;

  final ChapterRepository repository;
  ChapterController({required this.repository});

  getChapter() async {
    var args = Get.arguments;
    title(args.chapterTitle);
    try {
      isLoading(true);
      var chapter = await repository.getAll(chapter: args.chapterEndpoint);
      print(chapter.chapterPages);
      data(chapter);
      isError(false);
      isLoading(false);
    } catch (e) {
      isError(true);
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getChapter();
    super.onInit();
  }
}
