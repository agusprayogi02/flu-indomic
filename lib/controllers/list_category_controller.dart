import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:indomic/data/models/thumbnail_model.dart';
import 'package:indomic/data/services/api_exception.dart';
import 'package:indomic/data/services/api_exception_mapper.dart';
import 'package:indomic/data/services/repository/thumbnail_repository.dart';

class ListCategoryController extends GetxController
    with StateMixin<List<ThumbMangaList>> {
  static ListCategoryController get to => Get.find();

  final tabIndex = 0.obs;
  final scollIndex = 1.obs;
  final isMoreLoading = false.obs;
  final isMax = false.obs;
  final ScrollController scollController = ScrollController();
  final data = <ThumbMangaList>[].obs;

  ListCategoryController({required this.repository});
  final ThumbnailRepository repository;

  @override
  void onInit() {
    onSwich(0);
    scollController.addListener(() async {
      if (scollController.position.pixels ==
              scollController.position.maxScrollExtent &&
          isMax.isFalse) {
        this.getMore();
        change(data(), status: RxStatus.success());
        // print("max");
      }
    });
    super.onInit();
  }

  getMore() async {
    List<ThumbMangaList> list;
    isMoreLoading(true);
    var i = scollIndex() + 1;
    try {
      switch (tabIndex()) {
        case 0:
          list = await repository.getAll(index: i);
          break;
        case 1:
          list = await repository.getManhua(index: i);
          break;
        case 2:
          list = await repository.getManhwa(index: i);
          break;
        default:
          list = await repository.getAll(index: i);
      }
      scollIndex(i);
      data().addAll(list);
    } catch (e) {
      if (e is EmptyResultException) {
        isMax(true);
        return;
      }
      var error = ApiExceptionMapper.toErrorMessage(e);
      change(null, status: RxStatus.error(error));
    } finally {
      isMoreLoading(false);
    }
  }

  onSwich(int? val) async {
    var i = val ?? tabIndex();
    scollIndex(1);
    tabIndex(val);
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
          tabIndex(0);
      }
      data(list);
      change(list, status: RxStatus.success());
    } catch (e) {
      var error = ApiExceptionMapper.toErrorMessage(e);
      change(null, status: RxStatus.error(error));
    }
  }
}
