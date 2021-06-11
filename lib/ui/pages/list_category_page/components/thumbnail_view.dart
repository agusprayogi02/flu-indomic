import 'package:flutter/material.dart';
import 'package:indomic/controllers/list_category_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/components/thumbnail_card.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:get/get.dart';

class ThumbnailView extends GetView<ListCategoryController> {
  const ThumbnailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 1.5,
        right: defaultPadding * 1.5,
        top: defaultPadding * 1.5,
      ),
      child: Column(
        children: [
          Expanded(
            child: Obx(() {
              var to = ListCategoryController.to;
              if (to.isLoading.isTrue) {
                return LoadingCard(
                  height: getHeight(200),
                  width: getWidth(200),
                );
              } else {
                if (to.isError.isFalse) {
                  var data = to.data();
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: data.length,
                    itemBuilder: (context, index) => ThumbnailCard(
                      onPress: () {
                        Get.toNamed(Routes.DETAIL, arguments: data[index]);
                      },
                      btnIcon: Icons.arrow_forward_ios_rounded,
                      title: "${data[index].title}",
                      chapter: "${data[index].chapter}",
                      lastUpdated: "${data[index].updatedOn}",
                      imgSrc: "${data[index].thumb}",
                    ),
                  );
                } else {
                  return Text("Error!");
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
