import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/pages/list_category_page/components/thumbnail_view.dart';

import 'package:indomic/controllers/list_category_controller.dart';

class Body extends GetView<ListCategoryController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(), // to disable swiping left-right
      children: [
        ThumbnailView(),
        ThumbnailView(),
        ThumbnailView(),
      ],
    );
  }
}
