import 'package:flutter/material.dart';
import 'package:indomic/controllers/list_category_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/error_message.dart';
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
              child: controller.obx(
            (state) => ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: state!.length,
              itemBuilder: (context, index) => ThumbnailCard(
                onPress: () {
                  Get.toNamed(Routes.DETAIL, arguments: state[index]);
                },
                btnIcon: Icons.arrow_forward_ios_rounded,
                title: "${state[index].title}",
                chapter: "${state[index].chapter}",
                lastUpdated: "${state[index].updatedOn}",
                imgSrc: "${state[index].thumb}",
              ),
            ),
            onLoading: LoadingCard(
              height: getHeight(200),
              width: getWidth(200),
            ),
            onError: (error) => ErrorMessage(
              message: "$error",
              onPress: () => controller.onSwich(null),
            ),
          )),
        ],
      ),
    );
  }
}
