import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Popular".text.headline2(context).make(),
              TextButton(
                onPressed: () {},
                child: "View All".text.blue400.make(),
              ),
            ],
          ).marginSymmetric(horizontal: defaultMargin * 1.5),
          Container(
            width: context.width,
            color: Colors.black,
            margin: EdgeInsets.only(
              left: defaultMargin * 1.5,
              right: defaultMargin * 1.5,
              bottom: defaultMargin * 2,
            ),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 100,
                  color: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
