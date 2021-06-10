import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.find();

  final TextEditingController searchController = TextEditingController();
  final data = Rx<List<ThumbMangaList>>([ThumbMangaList()]);
  final isLoading = false.obs;
  final isError = false.obs;

  SearchController({required this.repository});
  final ThumbnailRepository repository;

  getSearch() async {
    try {
      isLoading(true);
      var list = await repository.getSearch(args: this.searchController.text);
      data(list);
      isError(false);
      isLoading(false);
    } catch (e) {
      isError(true);
      isLoading(false);
    }
  }
}
