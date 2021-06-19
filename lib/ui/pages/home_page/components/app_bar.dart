import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/home_controller.dart';
import 'package:indomic/controllers/search_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/components/search_bar.dart';
import 'package:indomic/ui/utils/utils.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: SearchBar(
      controller: SearchController.to.searchTextController,
      hint: "text_cari".tr,
      onFieldSubmitted: (e) {
        SearchController.to.getSearch();
        Get.toNamed(Routes.SEARCH);
      },
    ),
    actions: [
      CircleButton(
        icon: Icons.replay_sharp,
        tooltip: "reload".tr,
        isLeft: false,
        onPress: () {
          HomeController.to.getRecommended();
          HomeController.to.getLastUpdated();
        },
        marginVertical: defaultMargin * 1.2,
      ),
      CircleButton(
        onPress: () => Get.toNamed(Routes.ABOUT_ME),
        isLeft: false,
        tooltip: "about_me".tr,
        icon: Icons.info_outline_rounded,
        marginVertical: defaultMargin * 1.2,
      ),
      CircleButton(
        onPress: () => HomeController.to.showLanguage(),
        isLeft: false,
        tooltip: "bahasa".tr,
        icon: Icons.language_rounded,
        marginVertical: defaultMargin * 1.2,
      ),
    ],
  );
}
