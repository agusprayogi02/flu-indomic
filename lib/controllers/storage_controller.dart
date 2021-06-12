import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indomic/data/models/bookmark_model.dart';

class StorageController extends GetxController {
  static StorageController get to => Get.find();
  final GetStorage box = GetStorage('bookmark');

  Iterable<String> get readAll => box.getKeys();

  void writeBookmark(String key, BookmarkModel value) {
    box.write(
      key,
      bookmarkModelToJson(value),
    );
  }

  bool cekKey(String key) => this.readAll.contains(key);

  BookmarkModel readBookmark(String key) {
    return bookmarkModelFromJson(box.read(key));
  }

  void removeBookmark(String key) {
    if (this.cekKey(key)) {
      box.remove(key);
    }
  }

  updateTotal(String key, {int val = 10}) {
    if (this.cekKey(key)) {
      String read = box.read(key);
      print(read);
      BookmarkModel book = bookmarkModelFromJson(read);
      book.totalChapter = val;
      print(book);
      this.writeBookmark(key, book);
    }
  }
}
