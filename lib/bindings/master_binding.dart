import 'package:get/get.dart';
import 'package:indomic/controllers/storage_controller.dart';
import '../controllers/master_controller.dart';

class MasterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterController>(() => MasterController());
    Get.lazyPut<StorageController>(() => StorageController());
  }
}
