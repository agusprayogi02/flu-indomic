import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.message, required this.onPress})
      : super(key: key);

  final String message;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        "$message".text.headline3(context).red600.makeCentered(),
        SizedBox(
          height: 5,
        ),
        "msg_reload".tr.text.headline5(context).gray400.makeCentered()
      ],
    ).onInkTap(onPress);
  }
}
