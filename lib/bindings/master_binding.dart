
import 'package:get/get.dart';
import '../controllers/master_controller.dart';


class MasterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterController>(() => MasterController());
  }
}