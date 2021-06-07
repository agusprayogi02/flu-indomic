import 'package:get/get.dart';
import 'package:indomic/data/services/repository/detail_repository.dart';

class DetailController extends GetxController {
  final DetailRepository repository;
  DetailController({required this.repository});

  @override
  void onInit() {
    var args = Get.arguments;
    print(args.endPoint);
    super.onInit();
  }
}
