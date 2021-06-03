import 'package:get/get.dart';
import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/repository/recommended_repository.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final isLoading = false.obs;
  final isError = false.obs;
  final Rx<List<MangaList>> recommended = Rx<List<MangaList>>([MangaList()]);
  final Rx<List<ThumbMangaList>> thumbnail =
      Rx<List<ThumbMangaList>>([ThumbMangaList()]);

  HomeController({required this.thumbnailRepo, required this.recommendedRepo});
  final RecommendedRepository recommendedRepo;
  final ThumbnailRepository thumbnailRepo;

  getRecommeded() async {
    try {
      var list = await recommendedRepo.getAll();
      recommended(list);
      return list;
    } catch (e) {
      isError(true);
      return null;
    }
  }

  getLasestUpdated() async {
    try {
      var data = await thumbnailRepo.getAll();
      thumbnail(data);
      return data;
    } catch (e) {
      isError(true);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.toggle();
    getRecommeded();
    getLasestUpdated();
    isLoading.toggle();
  }
}
