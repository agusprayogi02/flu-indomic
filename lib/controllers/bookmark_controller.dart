import 'package:get/get.dart';
import 'package:indomic/controllers/storage_controller.dart';
import 'package:indomic/routes/app_pages.dart';

class BookmarkController extends GetxController {
  static BookmarkController get to => Get.find();

  StorageController storageController = StorageController.to;

  Rx<Iterable<String>> get getBookmarks => storageController.readAll.obs;

  delete(String key) => storageController.removeBookmark(key);

  toDetails(args) => Get.toNamed(Routes.DETAIL, arguments: args);

  @override
  void onInit() {
    getBookmarks();
    super.onInit();
  }
}
