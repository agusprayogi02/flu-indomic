import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import './thumbnail_card.dart';

Expanded buildLatestUpdate(BuildContext context) {
  return Expanded(
    child: Obx(
      () {
        // initial homecontroller Get.find()
        var to = HomeController.to;
        if (to.isThumbLoading.isTrue) {
          return Image.asset("assets/gif/spinner.gif");
        } else if (to.isThumbError.isFalse) {
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
        return "Internet Error.".text.headline3(context).makeCentered();
      },
    ),
  );
}