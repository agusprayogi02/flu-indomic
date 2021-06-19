import 'package:get/get.dart';
import 'package:indomic/controllers/storage_controller.dart';
import '../controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<StorageController>(() => StorageController());
  }
}
