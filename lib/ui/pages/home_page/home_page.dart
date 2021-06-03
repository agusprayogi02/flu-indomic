import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/components/bottom_navigation.dart';

import '../../../controllers/home_controller.dart';
import 'components/app_bar.dart';
import 'components/body.dart';

class HomePage extends GetResponsiveView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }
}
