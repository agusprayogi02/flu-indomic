import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
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
          SectionTitle(),
          GetBuilder(
            builder: (controller) {},
          ),
          Container(
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
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "Recommended".text.headline4(context).make(),
        TextButton(
          onPressed: () {},
          child: "View All".text.color(lightPrimaryC).make(),
        ),
      ],
    ).marginSymmetric(horizontal: defaultMargin * 1.5);
  }
}
