import 'package:get/get.dart';
import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/recommended_repository.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class HomeController extends GetxController with StateMixin<List<MangaList>> {
  static HomeController get to => Get.find();

  final isThumbLoading = true.obs;
  final isThumbError = false.obs;
  final thumbnail = <ThumbMangaList>[].obs;
  final errorMessage = "".obs;

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
    getRecommended();
    getLastUpdated();
    super.onInit();
  }
}
