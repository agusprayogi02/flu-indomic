import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/pages/list_category_page/components/thumbnail_view.dart';
import '../../../controllers/search_controller.dart';
import 'components/app_bar.dart';
import 'components/body.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Obx(
          () => controller.isKosong() ? ThumbnailView() : Body(),
        ),
      ),
    );
  }
}
