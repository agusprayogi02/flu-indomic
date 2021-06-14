import 'package:get/get.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class ListCategoryController extends GetxController {
  static ListCategoryController get to => Get.find();
  final isLoading = false.obs;
  final isError = false.obs;
  final Rx<List<ThumbMangaList>> data =
      Rx<List<ThumbMangaList>>([ThumbMangaList()]);

  ListCategoryController({required this.repository});
  final ThumbnailRepository repository;

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  getAll() async {
    try {
      isLoading(true);
      var list = await repository.getAll();
      data(list);
      isError(false);
      isLoading(false);
    } catch (e) {
      print(e.toString());
      isError(true);
      isLoading(false);
    }
  }

  getManhua() async {
    try {
      isLoading(true);
      var list = await repository.getManhua();
      data(list);
      isError(false);
      isLoading(false);
    } catch (e) {
      isError(true);
      isLoading(false);
    }
  }

  getManhwa() async {
    try {
      isLoading(true);
      var list = await repository.getManhwa();
      data(list);
      isError(false);
      isLoading(false);
    } catch (e) {
      isError(true);
      isLoading(false);
    }
  }

  onSwich(int val) {
    switch (val) {
      case 0:
        getAll();
        break;
      case 1:
        getManhua();
        break;
      case 2:
        getManhwa();
        break;
      default:
    }
  }
}
