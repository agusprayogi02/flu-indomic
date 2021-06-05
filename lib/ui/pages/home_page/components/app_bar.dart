import 'package:flutter/material.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/components/search_bar.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 45,
    title: SearchBar(
      hint: "Search Comic..",
    ),
    actions: [
      CircleButton(
        icon: Icons.replay_sharp,
        tooltip: "Reload",
        onPress: () {
          HomeController.to.getRecommended();
          HomeController.to.getLastUpdated();
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
