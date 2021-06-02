import 'package:flutter/material.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import './selection_title.dart';
import 'list_recommended.dart';

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
            title: "Latest Update",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
