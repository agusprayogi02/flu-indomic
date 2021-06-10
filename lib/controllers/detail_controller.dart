import 'package:get/get.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/data/services/repository/detail_repository.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();
  final isLoading = false.obs;
  final data = Rx<DetailModel>(DetailModel());
  final isError = false.obs;

  final DetailRepository repository;
  DetailController({required this.repository});

  getDetailKomic() async {
    var args = Get.arguments; //ThumbMangaList
    print(args.endpoint);
    isLoading(true);
    try {
      var list = await repository.getAll(endPoint: args.endpoint);
      data(list);
      isError(false);
      isLoading(false);
    } catch (e) {
      isError(true);
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getDetailKomic();
    super.onInit();
  }
}
