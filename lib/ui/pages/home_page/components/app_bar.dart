import 'package:flutter/material.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:indomic/ui/utils/utils.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: greyDarkC,
        ),
        hintText: "Search Comic..",
        hintStyle: TextStyle(
          color: greyDarkC,
        ),
        contentPadding: EdgeInsets.only(
          top: defaultPadding * 0.5,
          left: defaultPadding,
        ),
        fillColor: greyC,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(defaultRadius()),
        ),
      ),
    ).h(40).marginOnly(top: defaultMargin * 1.2),
    actions: [
      CircleButton(
        onPress: () {},
        icon: Icons.history,
      ),
      CircleButton(
        onPress: () {},
        icon: Icons.notifications,
      ),
    ],
  );
}
