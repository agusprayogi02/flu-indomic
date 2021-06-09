import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPress,
    this.tooltip = "",
  }) : super(key: key);

  final IconData icon;
  final Function() onPress;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: borderRadiusAll(),
        color: greyC,
      ),
      margin: EdgeInsets.only(
        right: defaultMargin * 1.4,
        top: defaultMargin * 1.5,
        bottom: defaultMargin * 0.5,
      ),
      child: Icon(
        icon,
        color: primaryC,
        size: 20,
      ),
    ).onInkTap(onPress).tooltip("$tooltip");
  }
}
