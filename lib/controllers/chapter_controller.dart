import 'package:get/get.dart';
import 'package:indomic/data/models/chapter_model.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/chapter_repository.dart';

class ChapterController extends GetxController with StateMixin<ChapterModel> {
  static ChapterController get to => Get.find();

  final data = Rx<ChapterModel>(ChapterModel());
  final title = "".obs;

  final ChapterRepository repository;
  ChapterController({required this.repository});

  getChapter() async {
    var args = Get.arguments;
    title(args.chapterTitle);
    try {
      change(null, status: RxStatus.loading());
      var chapter = await repository.getAll(chapter: args.chapterEndpoint);
      print(chapter.chapterPages);
      change(chapter, status: RxStatus.success());
    } catch (e) {
      var error = ApiExceptionMapper.toErrorMessage(e);
      change(null, status: RxStatus.error(error));
    }
  }

  @override
  void onInit() {
    getChapter();
    super.onInit();
  }
}
