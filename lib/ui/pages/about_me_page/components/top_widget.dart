import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/sunset.jpg",
          fit: BoxFit.cover,
        ).h(getHeight(270)).opacity(value: 0.95),
        Positioned(
          top: getHeight(120),
          left: getWidth(110),
          child: SvgPicture.asset("assets/icons/IndoMic.svg")
              .paddingAll(defaultPadding)
              .backgroundColor(greyC.withOpacity(0.5))
              .cornerRadius(4),
        ),
        Positioned(
          child: CircleButton(
            onPress: () => Get.back(),
            icon: Icons.arrow_back_ios_new_rounded,
            tooltip: "Back",
          ),
        ),
      ],
    );
  }
}
