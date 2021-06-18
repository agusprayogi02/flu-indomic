import 'package:get/get.dart';
import 'package:indomic/data/models/chapter_model.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/chapter_repository.dart';
import 'package:indomic/ui/utils/helper.dart';

import 'detail_controller.dart';
import 'storage_controller.dart';

class ChapterController extends GetxController with StateMixin<ChapterModel> {
  static ChapterController get to => Get.find();

  final title = "".obs;
  final detailController = DetailController.to;
  final storage = StorageController.to;
  final currentChapter =
      "".obs; // mengambil chapter keberapa yang sedang dibuka
  final isMax = false.obs; // kondisi jika sudah pada akhir chapter
  final isMin = false.obs; // kondisi jika sudah pada awal chapter

  final ChapterRepository repository;
  ChapterController({required this.repository});

  getChapter() {
    var args = Get.arguments;
    var index = detailController.chapters.indexOf(args),
        total = detailController.chapters.length;
    checkCondition(args, total - index, total);
    getApiChapter(args.chapterEndpoint);
    storage.updateChapter(
      detailController.endPoint(),
      total - index,
      detailController.chapters[index].chapterTitle,
    );
  }

  getApiChapter(String endPoint) async {
    try {
      change(null, status: RxStatus.loading());
      var chapter = await repository.getAll(chapter: endPoint);
      print(chapter.chapterPages);
      title(Helper.splitChapterTitle(chapter.chapterName));
      change(chapter, status: RxStatus.success());
    } catch (e) {
      var error = ApiExceptionMapper.toErrorMessage(e);
      change(null, status: RxStatus.error(error));
    }
  }

  getNextChapter() {
    var chapters = detailController.chapters,
        item = storage.readBookmark(detailController.endPoint());
    if (item.index <= item.totalChapter) {
      var index = item.index + 1, total = item.totalChapter;
      if (index <= total) {
        var item = chapters[total - index];
        getApiChapter(item.chapterEndpoint);
        checkCondition(item, index, total);
        storage.updateChapter(
          detailController.endPoint(),
          index,
          item.chapterTitle,
        );
      }
    }
  }

  getPreviousChapter() {
    var chapters = detailController.chapters,
        item = storage.readBookmark(detailController.endPoint());
    var index = item.index - 1, total = item.totalChapter;
    if (index >= 1) {
      var item = chapters[total - index];
      getApiChapter(item.chapterEndpoint);
      checkCondition(item, index, total);
      storage.updateChapter(
        detailController.endPoint(),
        index,
        item.chapterTitle,
      );
    }
  }

  checkCondition(Chapter chapter, int index, int total) {
    currentChapter(chapter.chapterTitle);
    if (index == 1) {
      isMin(true);
    } else if (index == total) {
      isMax(true);
    } else {
      isMin(false);
      isMax(false);
    }
  }

  @override
  void onInit() {
    getChapter();
    super.onInit();
  }
}
