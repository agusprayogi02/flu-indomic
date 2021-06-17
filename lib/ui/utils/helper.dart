class Helper {
  // untuk menghapus karakter slash dan mengambil string pertama
  static String splitSlash(String val) {
    var listString = val.split('/');
    return listString.first;
  }

// untuk mencari chapter keberapa yang sedang dituju
  static String splitChapter(String val) {
    var listString = val.split("Chapter");
    if (listString.length == 2) {
      return listString.last;
    }
    return listString.first;
  }

  // untuk meningkatkan ukutan dan kualitas gambar dari internet
  static String splitUrlImg(String val) {
    var listString = val.split("?");
    if (listString.length == 2) {
      return listString.first + "?w=500&quality=60";
    }
    return listString.first;
  }
}
