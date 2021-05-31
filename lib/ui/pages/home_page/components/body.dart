import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("H:${Get.height} W:${Get.width}");
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Popular".text.headline3(context).make(),
              TextButton(
                onPressed: () {},
                child: "View All".text.color(lightPrimaryC).make(),
              ),
            ],
          ).marginSymmetric(horizontal: defaultMargin * 1.5),
          Container(
            width: context.width,
            margin: EdgeInsets.only(
              left: defaultMargin * 1.5,
              right: defaultMargin * 1.5,
              bottom: defaultMargin * 2,
              top: defaultMargin,
            ),
            child: Row(
              children: [
                Container(
                  height: getHeight(140),
                  width: getWidth(120),
                  decoration: BoxDecoration(
                    borderRadius: borderRadiusAll(),
                    color: lightPrimaryC,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: borderRadiusOnly(tLeft: 8, tRight: 8),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/gif/ripple.gif",
                          image:
                              "https://cover.komiku.id/wp-content/uploads/2020/05/Komik-Murim-Login.jpg?resize=100,85&quality=60",
                          fit: BoxFit.cover,
                        ).h(getHeight(115)).w(getWidth(120)),
                      ),
                      "Murim Login".text.color(textC).make(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
