import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      child: ObxValue(
        (RxList<String> data) {
          var bookmarks = data();
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: bookmarks.length,
            itemBuilder: (_, index) {
              var item = controller.storageController
                  .readBookmark(bookmarks.elementAt(index));
              print(index);
              return ThumbnailCard(
                onPress: () => controller.toDetails(item),
                title: item.title,
                lastUpdated: "",
                imgSrc: item.thumb,
                btnIcon: Icons.delete_forever_rounded,
                chapter: "Last Read Chapter ${item.index}",
                btnPress: () => controller.delete(item.endpoint),
                btnColor: Colors.red,
              );
            },
          );
        },
        controller.bookmarks,
      ),
    );
  }
}
