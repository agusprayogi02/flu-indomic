import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/search_controller.dart';
import 'package:indomic/controllers/storage_controller.dart';
import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/recommended_repository.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';
import 'package:indomic/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<List<MangaList>> {
  static HomeController get to => Get.find();

  final isThumbLoading = true.obs;
  final isThumbError = false.obs;
  final thumbnail = <ThumbMangaList>[].obs;
  final errorMessage = "".obs;
  final isIndo = false.obs;
  final searchController = SearchController.to;
  final storageController = StorageController.to;

  HomeController({required this.thumbnailRepo, required this.recommendedRepo});
  final RecommendedRepository recommendedRepo;
  final ThumbnailRepository thumbnailRepo;

  getRecommended() async {
    change(null, status: RxStatus.loading());
    try {
      var list = await recommendedRepo.getAll();
      change(list, status: RxStatus.success());
    } catch (e) {
      var error = ApiExceptionMapper.toErrorMessage(e);
      change(null, status: RxStatus.error(error));
    }
  }

  gantiBahasa(bool val) {
    if (val != isIndo()) {
      if (val) {
        Get.updateLocale(Locale('id_ID'));
      } else {
        Get.updateLocale(Locale('en_US'));
      }
      isIndo(val);
      storageController.gantiBahasa(val);
    }
  }

  showLanguage() {
    Get.dialog(
      AlertDialog(
        title: Text("ganti".tr),
        content: Row(
          children: [
            Text(
              "Inggris",
              style: Get.textTheme.headline6,
            ),
            Obx(
              () => Switch(
                value: isIndo(),
                onChanged: (bool value) => gantiBahasa(value),
              ),
            ),
            Text(
              "Indonesia",
              style: Get.textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }

  getMore() {
    searchController.searchTextController.clear();
    Get.toNamed(Routes.SEARCH);
  }

  getLastUpdated() async {
    isThumbLoading(true);
    try {
      var data = await thumbnailRepo.getAll();
      thumbnail(data);
      isThumbError(false);
    } catch (e) {
      isThumbError(true);
      var error = ApiExceptionMapper.toErrorMessage(e);
      errorMessage(error);
    } finally {
      isThumbLoading(false);
    }
  }

  @override
  void onInit() {
    isIndo(storageController.getBahasa());
    getRecommended();
    getLastUpdated();
    super.onInit();
  }
}
