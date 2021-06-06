
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';


class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}