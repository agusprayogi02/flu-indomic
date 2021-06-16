import 'package:flutter/material.dart';
import 'package:indomic/controllers/bookmark_controller.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: "List Bookmarks".text.color(primaryC).make(),
    actions: [
      CircleButton(
        icon: Icons.replay_rounded,
        onPress: () => BookmarkController.to.onRefresh(),
        isLeft: false,
        marginVertical: defaultMargin * 1.5,
        iconSize: 20,
      ),
    ],
    bottom: PreferredSize(
      child: Container(
        color: primaryC,
        height: 1,
      ),
      preferredSize: Size(context.screenWidth, 1),
    ),
  );
}
