import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/search_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/error_message.dart';
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
      child: controller.obx(
        (data) => ListView.separated(
          itemBuilder: (context, index) {
            var item = data![index];
            return ThumbnailCard(
              onPress: () => Get.toNamed(Routes.DETAIL, arguments: item),
              btnIcon: Icons.arrow_forward_ios_rounded,
              title: item.title,
              lastUpdated: "${item.updatedOn}",
              imgSrc: item.thumb,
              isMangaType: true,
              type: item.type.toString(),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: data!.length,
        ),
        onError: (error) => ErrorMessage(
          message: "$error",
          onPress: () => controller.getSearch(),
        ),
        onLoading: LoadingCard(),
      ),
    );
  }
}
