import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class SearchController extends GetxController
    with StateMixin<List<ThumbMangaList>> {
  static SearchController get to => Get.find();

  final searchTextController = TextEditingController(text: "");
  final isKosong = false.obs;

  SearchController({required this.repository});
  final ThumbnailRepository repository;

  @override
  void onInit() {
    isKosong(cekKosong());
    super.onInit();
  }

  getSearch() async {
    if (cekKosong()) {
      change(null, status: RxStatus.loading());
      try {
        var list =
            await repository.getSearch(args: this.searchTextController.text);
        change(list, status: RxStatus.success());
      } catch (e) {
        var error = ApiExceptionMapper.toErrorMessage(e);
        change(null, status: RxStatus.error(error));
      }
    }
    isKosong(cekKosong());
  }

// cek apakah input cari == kosong
  bool cekKosong() => searchTextController.text != "" ? true : false;
}
