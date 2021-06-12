import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPress,
    this.tooltip = "",
    this.isLeft = true,
    this.color,
    this.marginVertical,
    this.iconSize,
  }) : super(key: key);

  final IconData icon;
  final Function() onPress;
  final String tooltip;
  final bool isLeft;
  final Color? color;
  final double? marginVertical;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: borderRadiusAll(),
        color: greyC,
        border: Border.all(
          color: color ?? greyC,
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.only(
        right: isLeft ? 0 : defaultMargin * 1.4,
        left: isLeft ? defaultMargin * 1.4 : 0,
        top: marginVertical ?? (defaultMargin * 1.3),
        bottom: marginVertical ?? (defaultMargin * 0.5),
      ),
      child: Icon(
        icon,
        color: color ?? primaryC,
        size: iconSize ?? 24,
      ),
    ).onInkTap(onPress).tooltip("$tooltip");
  }
}
