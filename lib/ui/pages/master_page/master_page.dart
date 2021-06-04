import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/components/bottom_navigation.dart';
import 'package:indomic/ui/pages/home_page/home_page.dart';
import 'package:indomic/ui/pages/list_category_page/list_category_page.dart';
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
          ],
          index: MasterController.to.index(),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
