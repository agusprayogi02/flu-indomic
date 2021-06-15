import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingMoreCard extends StatelessWidget {
  const LoadingMoreCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/gif/spinner.gif"),
          "Loading...".text.headline4(context).make(),
        ],
      ),
    );
  }
}
