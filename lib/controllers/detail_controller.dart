import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/storage_controller.dart';
import 'package:indomic/data/models/bookmark_model.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/detail_repository.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/utils/helper.dart';

class DetailController extends GetxController with StateMixin<DetailModel> {
  static DetailController get to => Get.find();

  final isSave = false.obs;
  final endPoint = "".obs;
  final data = Rx<DetailModel>(DetailModel());
  final StorageController storageController = StorageController.to;
  final chapters = <Chapter>[].obs;

  final DetailRepository repository;
  DetailController({required this.repository});

  getDetailKomic() async {
    var args = Get.arguments; //ThumbMangaList or MangaList
    endPoint(args.endpoint);
    change(null, status: RxStatus.loading());
    try {
      isSave(storageController.cekKey(args.endpoint));
      var list = await repository.getAll(endPoint: args.endpoint);
      data(list);
      chapters(list.chapter);
      change(list, status: RxStatus.success());
    } catch (e) {
      var error = ApiExceptionMapper.toErrorMessage(e);
      change(null, status: RxStatus.error(error));
    }
  }

  saveBookmark() {
    if (isSave()) {
      storageController.removeBookmark(endPoint());
      isSave(false);
      Get.snackbar(
        'Success',
        'Removed to Bookmark!',
        colorText: Colors.red,
      );
    } else {
      setBookmark();
    }
  }

  setBookmark() {
    var args = Get.arguments;
    BookmarkModel book = BookmarkModel();
    book.index = 1;
    book.title = data().title;
    book.endpoint = data().mangaEndpoint;
    book.thumb = args.thumb;
    book.chapter = Helper.splitChapter(chapters.last.chapterTitle);
    book.totalChapter = chapters.length;
    // print(endPoint());
    storageController.writeBookmark(endPoint(), book);
    print(storageController.readAll);
    isSave(true);
    Get.snackbar('Success', 'Added to Bookmark!');
  }

  startReading() {
    var key = endPoint();
    int index = 1, total = chapters.length;
    if (isSave()) {
      var save = storageController.readBookmark(key);
      storageController.updateTotal(key, val: total);
      index = save.index;
    } else {
      setBookmark();
    }
    var chapter = chapters[total - index];
    Get.toNamed(Routes.CHAPTER, arguments: chapter);
  }

  @override
  void onInit() {
    getDetailKomic();
    super.onInit();
  }
}
