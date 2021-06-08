import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  static StorageController get to => Get.find();
  final GetStorage box = GetStorage('bookmark');

  get readAll => box.getKeys();
}
