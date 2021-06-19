import 'dart:ui';

import 'package:get/get.dart';
import 'package:indomic/controllers/storage_controller.dart';
import 'package:indomic/routes/app_pages.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  final StorageController storageController = Get.find();

  getBahasa() {
    var bahasa = storageController.getBahasa();
    Get.updateLocale(bahasa ? Locale("id_ID") : Locale("en_US"));
  }

  @override
  void onInit() {
    // untuk mengubah bahasa dari pengaturan
    getBahasa();
    // Menunggu 3 s untuk pindah halaman
    Future.delayed(
      Duration(seconds: 3),
      () => Get.offNamed(Routes.MASTER),
    );
    super.onInit();
  }
}
