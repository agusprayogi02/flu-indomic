import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/search_controller.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/components/search_bar.dart';
import 'package:indomic/ui/utils/utils.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    backwardsCompatibility: false,
    leading: CircleButton(
      icon: Icons.arrow_back_ios_rounded,
      onPress: () {
        SearchController.to.searchTextController.clear();
        Get.back();
      },
      tooltip: "back".tr,
      marginVertical: defaultMargin * 1.2,
    ),
    title: SearchBar(
      hint: 'text_cari'.tr,
      controller: SearchController.to.searchTextController,
      onFieldSubmitted: (e) => SearchController.to.getSearch(),
    ),
  );
}
