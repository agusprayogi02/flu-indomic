import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/pages/bookmark_page/bookmark_page.dart';

import '../../components/bottom_navigation.dart';
import '../home_page/home_page.dart';
import '../list_category_page/list_category_page.dart';
import '../../../controllers/master_controller.dart';

class MasterPage extends GetView<MasterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          children: [
            HomePage(),
            ListCategoryPage(),
            BookmarkPage(),
          ],
          index: controller.index(),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
