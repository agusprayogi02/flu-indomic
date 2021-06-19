import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.icon,
    this.height,
    this.bgColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function() onPress;
  final double? height;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadiusAll(),
          color: bgColor,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryC,
              size: 18,
            ),
            SizedBox(
              width: 4,
            ),
            title.text.maxLines(1).ellipsis.headline6(context).make()
          ],
        ),
      ),
    );
  }
}
