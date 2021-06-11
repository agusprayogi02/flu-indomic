import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/search_controller.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/components/thumbnail_card.dart';
import 'package:indomic/ui/utils/utils.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      child: Obx(() {
        var to = SearchController.to;
        if (to.isLoading.isTrue) {
          return LoadingCard();
        } else {
          if (to.isError.isFalse) {
            return ListView.separated(
              itemBuilder: (context, index) {
                var item = to.data()[index];
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
              itemCount: to.data().length,
            );
          } else {
            return Text("Error");
          }
        }
      }),
    );
  }
}
