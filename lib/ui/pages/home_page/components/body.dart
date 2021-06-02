import 'package:flutter/material.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import './selection_title.dart';
import 'package:get/get.dart';

import './recommended_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("H:${Get.height} W:${Get.width}");
    return SafeArea(
      child: Column(
        children: [
          SelectionTitle(
            title: "Recommended",
            onPress: () {},
          ),
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              var data = controller.getRecommeded();
              return Container(
                width: context.width,
                height: getHeight(120),
                margin: EdgeInsets.only(
                  left: defaultMargin * 1.5,
                  right: defaultMargin * 1.5,
                  bottom: defaultMargin * 2,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => RecommendedCard(
                    title: "Hardcore Leveling Warrior",
                    imgSrc:
                        "https://cover.komiku.id/wp-content/uploads/Manhwa-Hardcore-Leveling-Warrior.jpg?resize=450,235&quality=60",
                  ).marginOnly(right: defaultMargin),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
