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
      ),
      child: Obx(
        () {
          controller.onRefresh();
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: controller.bookmarks.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              var item = controller.storageController
                  .readBookmark(controller.bookmarks.elementAt(index));
              return ThumbnailCard(
                onPress: () => controller.toDetails(item),
                title: item.title,
                lastUpdated: "",
                totalChapter: item.totalChapter,
                imgSrc: item.thumb,
                btnIcon: Icons.delete_forever_rounded,
                chapter: "terakhir".tr + " ${item.chapter}",
                btnPress: () => controller.delete(item.endpoint),
                btnColor: Colors.red,
              );
            },
          );
        },
      ),
    ).marginOnly(top: defaultMargin);
  }
}
