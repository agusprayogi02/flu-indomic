class Helper {
  // untuk menghapus karakter slash dan mengambil string pertama
  static String splitSlash(String val) {
    var listString = val.split('/');
    return listString[0];
  }

// untuk mencari chapter keberapa yang sedang dituju
  static String splitChapter(String val) {
    var listString = val.split("Chapter");
    if (listString.length == 2) {
      return listString.last;
    }
    return listString.first;
  }
}
