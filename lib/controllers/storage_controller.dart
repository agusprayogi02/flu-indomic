import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indomic/data/models/bookmark_model.dart';

class StorageController extends GetxController {
  static StorageController get to => Get.find();
  final GetStorage box = GetStorage('bookmark');

  get readAll => box.getKeys();

  void writeBookmark(String key, String value) => box.write(key, value);

  BookmarkModel readBookmark(String key) => box.read(key);
}
