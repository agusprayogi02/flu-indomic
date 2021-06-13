import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/chapter_controller.dart';
import 'package:indomic/ui/components/loading_card.dart';

class Body extends GetView<ChapterController> {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return LoadingCard();
      } else {
        if (controller.isError.isFalse) {
          var listImage = controller.data().chapterImage!;
          return ListView.builder(
            itemCount: listImage.length,
            itemBuilder: (context, index) {
              var image = listImage[index];
              return SizedBox(
                width: Get.width,
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Image.asset("assets/gif/ripple.gif"),
                  imageUrl: image.chapterImageLink,
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/Default_Image_Thumbnail.png"),
                ),
              );
            },
          );
        } else {
          return Text("Error!");
        }
      }
    });
  }
}
