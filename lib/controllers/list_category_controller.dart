import 'package:get/get.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class ListCategoryController extends GetxController
    with StateMixin<List<ThumbMangaList>> {
  static ListCategoryController get to => Get.find();

  final index = 0.obs;

  ListCategoryController({required this.repository});
  final ThumbnailRepository repository;

  @override
  void onInit() {
    onSwich(0);
    super.onInit();
  }

  onSwich(int? val) async {
    var i = val ?? index();
    index(val);
    List<ThumbMangaList> list;
    try {
      change(null, status: RxStatus.loading());
      switch (i) {
        case 0:
          list = await repository.getAll();
          break;
        case 1:
          list = await repository.getManhua();
          break;
        case 2:
          list = await repository.getManhwa();
          break;
        default:
          list = await repository.getAll();
          index(0);
      }

      change(list, status: RxStatus.success());
    } catch (e) {
      var error = ApiExceptionMapper.toErrorMessage(e);
      change(null, status: RxStatus.error(error));
    }
  }
}
