import 'package:get/get.dart';
import 'package:indomic/data/provider/recommended_api.dart';
import 'package:indomic/data/services/repository/recommended_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: RecommendedRepository(
          api: RecommendedApi(),
        ),
      ),
    );
  }
}
