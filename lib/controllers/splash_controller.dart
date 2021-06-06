import 'package:get/get.dart';
import 'package:indomic/routes/app_pages.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    // Menunggu 3 s untuk pindah halaman
    Future.delayed(
      Duration(seconds: 3),
      () => Get.offAndToNamed(Routes.MASTER),
    );
    super.onInit();
  }
}
