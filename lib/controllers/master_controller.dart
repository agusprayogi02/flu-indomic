import 'package:get/get.dart';

// digunakan untuk navigasi pada halaman utama
class MasterController extends GetxController {
  static MasterController get to => Get.find();

  final index = 0.obs;

  // untuk mengubah tab pada bottom navigation
  void onChangeTab(int i) => index(i);
}
