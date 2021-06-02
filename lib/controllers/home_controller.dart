import 'package:get/get.dart';
import 'package:indomic/data/models/recommended_model.dart';
import 'package:indomic/data/services/repository/recommended_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final isLoading = false.obs;
  final isError = false.obs;
  final Rx<List<MangaList>> data = Rx<List<MangaList>>([MangaList()]);

  HomeController({required this.repository});
  final RecommendedRepository repository;

  getRecommeded() async {
    isLoading.toggle();
    try {
      var list = await repository.getAll();
      data(list);
      isLoading.toggle();
      return list;
    } catch (e) {
      isError(true);
      isLoading.toggle();
      return null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRecommeded();
  }
}
