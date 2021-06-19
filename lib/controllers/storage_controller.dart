import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indomic/data/models/bookmark_model.dart';
import 'package:indomic/ui/utils/helper.dart';

class StorageController extends GetxController {
  static StorageController get to => Get.find();

  final GetStorage bookmarkBox = GetStorage('bookmark');
  final GetStorage bahasaBox = GetStorage('bahasa');

  gantiBahasa(bool val) {
    if (bahasaBox.hasData('bahasa')) {
      if (val != bahasaBox.read('bahasa')) {
        bahasaBox.write('bahasa', val);
      }
    } else {
      bahasaBox.write('bahasa', val);
    }
  }

  bool getBahasa() {
    if (bahasaBox.hasData('bahasa')) {
      return bahasaBox.read('bahasa');
    } else {
      var val = Get.deviceLocale!.languageCode == "id" ? true : false;
      gantiBahasa(val);
      return val;
    }
  }

  Iterable<String> get readAll => bookmarkBox.getKeys();

  void writeBookmark(String key, BookmarkModel value) {
    bookmarkBox.write(
      Helper.splitSlash(key),
      bookmarkModelToJson(value),
    );
  }

  bool cekKey(String key) => this.readAll.contains(Helper.splitSlash(key));

  BookmarkModel readBookmark(String valKey) {
    var key = Helper.splitSlash(valKey);
    return bookmarkModelFromJson(bookmarkBox.read(key));
  }

  void removeBookmark(String valKey) {
    var key = Helper.splitSlash(valKey);
    if (this.cekKey(key)) {
      bookmarkBox.remove(key);
    }
  }

  updateChapter(String key, int index, String chapterTitle) {
    var extactKey = Helper.splitSlash(key);
    if (this.cekKey(extactKey)) {
      String read = bookmarkBox.read(extactKey);
      // print(extactKey);
      // print(key);
      BookmarkModel bookmark = bookmarkModelFromJson(read);
      bookmark.chapter = chapterTitle;
      bookmark.index = index;
      this.writeBookmark(extactKey, bookmark);
    }
  }

  updateTotal(String valKey, {int val = 10}) {
    var key = Helper.splitSlash(valKey);
    if (this.cekKey(key)) {
      String read = bookmarkBox.read(key);
      // print(read);
      BookmarkModel book = bookmarkModelFromJson(read);
      book.totalChapter = val;
      // print(book);
      this.writeBookmark(key, book);
    }
  }
}
