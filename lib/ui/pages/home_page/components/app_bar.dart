import 'package:flutter/material.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:indomic/ui/utils/utils.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 45,
    title: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: greyDarkC,
          size: 20,
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
    ).h(32).marginOnly(top: defaultMargin * 1.2),
    actions: [
      CircleButton(
        icon: Icons.replay_sharp,
        tooltip: "Reload",
        onPress: () {
          HomeController.to.getRecommeded();
          HomeController.to.getLasestUpdated();
        },
      ),
      CircleButton(
        onPress: () {},
        tooltip: "Book Mark",
        icon: Icons.bookmark,
      ),
    ],
  );
}
