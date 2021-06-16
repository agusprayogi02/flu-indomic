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

  onRefresh() => bookmarks(storageController.readAll.toList());

  toDetails(args) => Get.toNamed(Routes.DETAIL, arguments: args);

  @override
  void onInit() {
    getBookmarks;
    onRefresh();
    super.onInit();
  }
}
