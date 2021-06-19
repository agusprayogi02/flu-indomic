import 'package:flutter/material.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:get/get.dart';

import './selection_title.dart';
import './list_recommended.dart';
import './list_latest_update.dart';

class Body extends GetView<HomeController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("H:${Get.height} W:${Get.width}");
    return SafeArea(
      child: Column(
        children: [
          buildListRecommended(context),
          SelectionTitle(
            title: "baru_update".tr,
            onPress: () => controller.getMore(),
          ),
          buildLatestUpdate(context),
        ],
      ),
    );
  }
}
