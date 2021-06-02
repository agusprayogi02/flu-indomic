import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import './recommended_card.dart';
import './selection_title.dart';

Column buildListRecommended(BuildContext context) {
  return Column(
    children: [
      SelectionTitle(
        title: "Recommended",
        onPress: () {},
      ),
      Container(
        width: context.width,
        height: getHeight(120),
        margin: EdgeInsets.only(
          left: defaultMargin * 1.5,
          right: defaultMargin * 1.5,
          bottom: defaultMargin / 2,
        ),
        child: Obx(
          () {
            // mengambil Get.find()
            var to = HomeController.to;
            if (to.isLoading()) {
              return Image.asset("assets/gif/ripple.gif");
            }
            if (to.isError.isFalse) {
              // get data all
              var data = to.data();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RecommendedCard(
                  title: "${data[index].title}",
                  imgSrc: "${data[index].thumb}",
                  onTap: () => print("tap"),
                ).marginOnly(right: defaultMargin),
              );
            }
            return "Conection error!".text.headline3(context).makeCentered();
          },
        ),
      ),
    ],
  );
}
