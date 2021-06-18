import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/error_message.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/utils/utils.dart';

import '../../../components/thumbnail_card.dart';

Expanded buildLatestUpdate(BuildContext context) {
  return Expanded(
    child: Obx(
      () {
        // initial homecontroller Get.find()
        var to = HomeController.to;
        if (to.isThumbLoading.isTrue) {
          return LoadingCard();
        } else {
          if (to.isThumbError.isFalse) {
            var list = to.thumbnail();
            return ListView.separated(
              itemCount: list.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) => ThumbnailCard(
                title: "${list[index].title}",
                type: "${list[index].chapter}",
                isMangaType: true,
                lastUpdated: "${list[index].updatedOn}",
                btnIcon: Icons.arrow_forward_ios_rounded,
                btnColor: primaryC,
                onPress: () =>
                    Get.toNamed(Routes.DETAIL, arguments: list[index]),
                imgSrc: list[index].thumb,
              ),
            ).marginSymmetric(horizontal: defaultMargin * 1.5);
          }
          return ErrorMessage(
            message: to.errorMessage(),
            onPress: () => to.getLastUpdated(),
          );
        }
      },
    ),
  );
}
