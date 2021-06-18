import 'package:get/get.dart';
import 'package:indomic/controllers/storage_controller.dart';
import 'package:indomic/routes/app_pages.dart';

class BookmarkController extends GetxController {
  static BookmarkController get to => Get.find();

  final storageController = StorageController.to;
  final bookmarks = <String>[].obs;

  Iterable<String> get getBookmarks => StorageController.to.readAll;

  delete(String key) {
    storageController.removeBookmark(key);
    onRefresh();
  }

  onRefresh() {
    bookmarks(getBookmarks.toList());
    bookmarks.forEach((element) {
      // untuk mengetahui perubahan pada database lokal dan mengubahnya
      storageController.box.listenKey(
        element,
        (val) => bookmarks(getBookmarks.toList()),
      );
    });
  }

  toDetails(args) => Get.toNamed(Routes.DETAIL, arguments: args);

  @override
  void onInit() {
    onRefresh();
    super.onInit();
  }
}
