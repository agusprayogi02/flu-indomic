import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/error_message.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';

import './recommended_card.dart';
import './selection_title.dart';

Column buildListRecommended(BuildContext context) {
  return Column(
    children: [
      SelectionTitle(
        title: "Recommended",
        isButton: false,
      ).marginOnly(top: defaultMargin, bottom: defaultMargin / 4),
      Container(
        width: context.width,
        height: getHeight(120),
        margin: EdgeInsets.only(
          left: defaultMargin * 1.5,
          right: defaultMargin * 1.5,
          top: defaultMargin * 1.5,
          bottom: defaultMargin / 2,
        ),
        child: HomeController.to.obx(
          (state) => ListView.builder(
            shrinkWrap: true,
            itemCount: state!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => RecommendedCard(
              title: "${state[index].title}",
              imgSrc: state[index].thumb,
              onTap: () {
                Get.toNamed(
                  Routes.DETAIL,
                  arguments: state[index],
                );
              },
            ).marginOnly(right: defaultMargin),
          ),
          onLoading: LoadingCard(
            text: false,
            image: 2,
          ),
          onError: (error) => ErrorMessage(
            message: "$error",
            onPress: () => HomeController.to.getRecommended(),
          ),
        ),
      ),
    ],
  );
}
