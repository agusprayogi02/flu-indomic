import 'package:get/get.dart';
import 'package:indomic/data/provider/chapter_api.dart';
import 'package:indomic/data/services/repository/chapter_repository.dart';
import '../controllers/chapter_controller.dart';

class ChapterBinding implements Bindings {
  @override
  void dependencies() {
    var repo = ChapterRepository(api: ChapterApi());
    Get.lazyPut<ChapterController>(
      () => ChapterController(
        repository: repo,
      ),
    );
  }
}
