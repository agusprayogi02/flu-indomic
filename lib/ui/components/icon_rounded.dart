import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class IconRounded extends StatelessWidget {
  const IconRounded({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Icon(
        icon,
        size: 35,
      ),
      color: textC.withOpacity(0.9),
    ).cornerRadius(8).onInkTap(onPress);
  }
}
