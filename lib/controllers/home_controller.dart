import 'package:get/get.dart';
import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/repository/recommended_repository.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final isThumbLoading = true.obs;
  final isRecommendLoading = true.obs;
  final isThumbError = false.obs;
  final isRecommendError = false.obs;
  final Rx<List<MangaList>> recommended = Rx<List<MangaList>>([MangaList()]);
  final Rx<List<ThumbMangaList>> thumbnail =
      Rx<List<ThumbMangaList>>([ThumbMangaList()]);

  HomeController({required this.thumbnailRepo, required this.recommendedRepo});
  final RecommendedRepository recommendedRepo;
  final ThumbnailRepository thumbnailRepo;

  getRecommeded() async {
    isRecommendLoading(true);
    try {
      var list = await recommendedRepo.getAll();
      recommended(list);
      isRecommendError(false);
      isRecommendLoading(false);
      return list;
    } catch (e) {
      isRecommendError(true);
      isRecommendLoading(false);
      return null;
    }
  }

  getLasestUpdated() async {
    isThumbLoading(true);
    try {
      var data = await thumbnailRepo.getAll();
      thumbnail(data);
      isThumbError(false);
      isThumbLoading(false);
      return data;
    } catch (e) {
      isThumbError(true);
      isThumbLoading(false);
      return null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRecommeded();
    getLasestUpdated();
  }
}
