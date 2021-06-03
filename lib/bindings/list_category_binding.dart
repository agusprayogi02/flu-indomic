import 'package:get/get.dart';
import '../controllers/list_category_controller.dart';

class ListCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListCategoryController>(() => ListCategoryController());
  }
}
