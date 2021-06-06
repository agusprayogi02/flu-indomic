import 'package:get/get.dart';
import 'package:indomic/data/provider/thumbnail_api.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';
import '../controllers/list_category_controller.dart';

class ListCategoryBinding implements Bindings {
  @override
  void dependencies() {
    var repository = ThumbnailRepository(api: ThumbnailApi());
    Get.lazyPut<ListCategoryController>(
        () => ListCategoryController(repository: repository));
  }
}
