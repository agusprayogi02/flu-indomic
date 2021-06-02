import 'package:get/get.dart';
import 'package:indomic/data/provider/recommended_api.dart';
import 'package:indomic/data/services/repository/recommended_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final isLoading = false.obs;
  final isError = false.obs;
  final repository = RecommendedRepository(api: RecommendedApi());

  getRecommeded() async {
    try {
      isLoading.isTrue;
      var list = await repository.getAll();
      return list;
    } catch (e) {
      isError.isTrue;
      isLoading.isFalse;
      return null;
    }
  }
}
