import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/search_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/components/thumbnail_card.dart';
import 'package:indomic/ui/utils/utils.dart';

class Body extends GetView<SearchController> {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      child: Obx(() {
        if (controller.isLoading.isTrue) {
          return LoadingCard();
        } else {
          if (controller.isError.isFalse) {
            return ListView.separated(
              itemBuilder: (context, index) {
                var item = controller.data()[index];
                return ThumbnailCard(
                  onPress: () {
                    Get.toNamed(Routes.DETAIL, arguments: item);
                  },
                  btnIcon: Icons.arrow_forward_ios_rounded,
                  title: item.title,
                  lastUpdated: "${item.updatedOn}",
                  imgSrc: item.thumb,
                  isMangaType: true,
                  type: item.type.toString(),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: controller.data().length,
            );
          } else {
            return Text("Error");
          }
        }
      }),
    );
  }
}
