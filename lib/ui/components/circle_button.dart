import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[400],
      ),
      margin: EdgeInsets.only(
        right: defaultMargin * 1.4,
        top: defaultMargin * 1.5,
        bottom: defaultMargin * 0.5,
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(icon),
      ),
    );
  }
}
