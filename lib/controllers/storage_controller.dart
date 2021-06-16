import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indomic/data/models/bookmark_model.dart';
import 'package:indomic/ui/utils/helper.dart';

class StorageController extends GetxController {
  static StorageController get to => Get.find();
  final GetStorage box = GetStorage('bookmark');

  Iterable<String> get readAll => box.getKeys();

  void writeBookmark(String key, BookmarkModel value) {
    box.write(
      Helper.splitSlash(key),
      bookmarkModelToJson(value),
    );
  }

  bool cekKey(String key) => this.readAll.contains(Helper.splitSlash(key));

  BookmarkModel readBookmark(String valKey) {
    var key = Helper.splitSlash(valKey);
    return bookmarkModelFromJson(box.read(key));
  }

  void removeBookmark(String valKey) {
    var key = Helper.splitSlash(valKey);
    if (this.cekKey(key)) {
      box.remove(key);
    }
  }

  updateChapter(String key, int index, String chapterTitle) {
    var extactKey = Helper.splitSlash(key);
    if (this.cekKey(extactKey)) {
      String read = box.read(extactKey);
      BookmarkModel bookmark = bookmarkModelFromJson(read);
      bookmark.chapter = Helper.splitChapter(chapterTitle);
      bookmark.index = index;
      this.writeBookmark(extactKey, bookmark);
    }
  }

  updateTotal(String valKey, {int val = 10}) {
    var key = Helper.splitSlash(valKey);
    if (this.cekKey(key)) {
      String read = box.read(key);
      // print(read);
      BookmarkModel book = bookmarkModelFromJson(read);
      book.totalChapter = val;
      // print(book);
      this.writeBookmark(key, book);
    }
  }
}
