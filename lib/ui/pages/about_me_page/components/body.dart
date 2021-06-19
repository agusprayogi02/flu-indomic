import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indomic/controllers/about_me_controller.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:share/share.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import 'custom_button.dart';
import 'social_media_icon.dart';
import 'tentang_app.dart';
import 'top_widget.dart';

class Body extends GetView<AboutMeController> {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopWidget(),
        TentangApp()
            .paddingAll(defaultPadding)
            .backgroundColor(greyC)
            .cornerRadius(8)
            .marginAll(defaultMargin * 1.5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin * 1.5),
          child: Column(
            children: [
              Divider(
                thickness: 1,
              ),
              CustomButton(
                icon: Icons.share_rounded,
                title: "Share Aplikasi",
                onTap: () => Share.share(
                  "https://tinyurl.com/App-IndoMic",
                  subject: 'Download App Indomic',
                ),
              ),
              Divider(
                thickness: 1,
              ),
              CustomButton(
                icon: FontAwesomeIcons.donate,
                title: "Donasi via OVO",
                onTap: () => controller.showDonate(),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
        Spacer(),
        "dikembangankan oleh :".text.headline5(context).make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pp.jpg",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ).h(100).w(100).cornerRadius(50).opacity(value: 0.9),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Agus Prayogi".text.headline3(context).make(),
                SizedBox(
                  height: 3,
                ),
                SocialMediaIcon(
                  icon: FontAwesomeIcons.discord,
                  title: "agus.apy#6177",
                ),
                SizedBox(
                  height: 3,
                ),
                SocialMediaIcon(
                  icon: FontAwesomeIcons.instagram,
                  title: "@agus.apy",
                ),
                SizedBox(
                  height: 3,
                ),
                SocialMediaIcon(
                  icon: FontAwesomeIcons.github,
                  title: "@agusprayogi02",
                ),
              ],
            )
          ],
        ).marginAll(defaultMargin * 1.5)
      ],
    );
  }
}
