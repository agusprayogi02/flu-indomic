import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:indomic/controllers/master_controller.dart';
import 'package:indomic/ui/utils/utils.dart';

class BottomNavigation extends GetView<MasterController> {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GNav(
        rippleColor: greyDarkC, // tab button ripple color when pressed
        hoverColor: greyC, // tab button hover color
        haptic: true, // haptic feedback
        curve: Curves.easeOutExpo, // tab animation curves
        duration: Duration(milliseconds: 500), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        selectedIndex: MasterController.to.index(),
        activeColor: primaryC, // selected icon and text color
        iconSize: 32, // tab button icon size
        onTabChange: (val) => MasterController.to.onChangeTab(val),
        tabBackgroundColor:
            primaryC.withOpacity(0.3), // selected tab background color
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ), // navigation bar padding
        tabs: [
          GButton(
            icon: Icons.home_rounded,
            text: 'Home',
          ),
          GButton(
            icon: Icons.list_rounded,
            text: 'List',
          ),
          GButton(
            icon: Icons.bookmark_rounded,
            text: 'Bookmark',
          ),
        ],
      ),
    );
  }
}
