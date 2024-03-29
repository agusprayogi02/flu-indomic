import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class SelectionTitle extends StatelessWidget {
  const SelectionTitle({
    Key? key,
    required this.title,
    this.onPress,
    this.isButton = true,
  }) : super(key: key);

  final String title;
  final Function()? onPress;
  final bool isButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title".text.headline5(context).make(),
        isButton
            ? TextButton(
                onPressed: onPress,
                child: "view_all".tr.text.color(lightPrimaryC).make(),
              )
            : Text(""),
      ],
    ).marginSymmetric(horizontal: defaultMargin * 1.5);
  }
}
