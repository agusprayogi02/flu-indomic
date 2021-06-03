import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import './selection_title.dart';
import './list_recommended.dart';
import './thumbnail_card.dart';

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
          Expanded(
            child: Obx(
              () {
                // initial homecontroller Get.find()
                var to = HomeController.to;
                if (to.isLoading.isTrue) {
                  return Image.asset("");
                }
                if (to.thumbnail().isNotEmpty) {
                  var list = to.thumbnail();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: context.width / 2.1,
                      mainAxisExtent: 100,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: defaultMargin * 1.5,
                      mainAxisSpacing: defaultMargin * 1.5,
                    ),
                    itemCount: list.length,
                    itemBuilder: (context, index) => ThumbnailCard(
                      title: "${list[index].title}",
                      chapter: "${list[index].chapter}",
                      lastUpdated: "${list[index].updatedOn}",
                      onPress: () {},
                      imgSrc: '${list[index].thumb}',
                    ),
                  ).marginSymmetric(horizontal: defaultMargin * 1.5);
                }
                return "Interner Error.".text.make();
              },
            ),
          ),
        ],
      ),
    );
  }
}
