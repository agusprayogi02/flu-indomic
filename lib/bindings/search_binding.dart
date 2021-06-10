import 'package:get/get.dart';
import 'package:indomic/data/provider/thumbnail_api.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';
import '../controllers/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    var repo = ThumbnailRepository(api: ThumbnailApi());
    Get.lazyPut<SearchController>(
      () => SearchController(repository: repo),
    );
  }
}
