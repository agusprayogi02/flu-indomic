import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/utils/utils.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding,
        ),
        decoration: BoxDecoration(
          color: greyC,
          borderRadius: borderRadiusAll(),
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
            Text(
              title,
              style: Get.textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
