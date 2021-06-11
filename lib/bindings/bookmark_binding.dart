
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';


class BookmarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkController>(() => BookmarkController());
  }
}