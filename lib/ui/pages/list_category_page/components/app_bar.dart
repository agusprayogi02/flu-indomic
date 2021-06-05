import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/utils/utils.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: lightPrimaryC.withOpacity(0.8),
    title: Text(
      "List Comic",
      style: TextStyle(color: blackC, fontWeight: FontWeight.w700),
    ),
    bottom: PreferredSize(
      preferredSize: Size(Get.width, 50),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 2,
          vertical: defaultPadding,
        ),
        child: TabBar(
          labelColor: textC,
          unselectedLabelColor: blackC,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: primaryC,
            borderRadius: borderRadiusAll(),
          ),
          labelStyle: TextStyle(fontSize: 16),
          tabs: [
            Tab(
              text: "All",
            ),
            Tab(
              text: "Manhua",
            ),
            Tab(
              text: "Manhwa",
            ),
          ],
        ),
      ),
    ),
  );
}
