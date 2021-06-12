import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:indomic/controllers/bookmark_controller.dart';
import 'package:indomic/ui/components/thumbnail_card.dart';
import 'package:indomic/ui/utils/utils.dart';

class Body extends GetView<BookmarkController> {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin * 1.5,
        vertical: defaultMargin,
      ),
      child: Obx(() {
        var bookmarks = BookmarkController.to.getBookmarks();
        // print(bookmarks);
        return ListView.builder(
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            var item = BookmarkController.to.storageController
                .readBookmark(bookmarks.elementAt(index));
            return ThumbnailCard(
              onPress: () {},
              title: item.title,
              lastUpdated: "",
              imgSrc: item.thumb,
              btnIcon: Icons.delete_forever_rounded,
              chapter: "Last Read Chapter ${item.index}",
              btnPress: () => BookmarkController.to.delete(item.endpoint),
              btnColor: Colors.red,
            );
          },
        );
      }),
    );
  }
}
