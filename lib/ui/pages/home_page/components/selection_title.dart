import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class SelectionTitle extends StatelessWidget {
  const SelectionTitle({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title".text.headline5(context).make(),
        TextButton(
          onPressed: onPress,
          child: "View All".text.color(lightPrimaryC).make(),
        ),
      ],
    ).marginSymmetric(horizontal: defaultMargin * 1.5);
  }
}
