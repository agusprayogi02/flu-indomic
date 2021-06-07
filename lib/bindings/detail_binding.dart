import 'package:get/get.dart';
import 'package:indomic/data/provider/detail_api.dart';
import 'package:indomic/data/services/repository/detail_repository.dart';
import '../controllers/detail_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    var repo = DetailRepository(api: DetailApi());
    Get.lazyPut<DetailController>(
      () => DetailController(repository: repo),
    );
  }
}
