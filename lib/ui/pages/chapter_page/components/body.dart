import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/chapter_controller.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/components/error_message.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class Body extends GetView<ChapterController> {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller.obx(
          (state) {
            var listImage = state!.chapterImage!;
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
                    errorWidget: (context, url, error) => Image.asset(
                        "assets/images/Default_Image_Thumbnail.png"),
                  ),
                );
              },
            );
          },
          onError: (error) => ErrorMessage(
            message: "$error",
            onPress: () => controller.getChapter(),
          ),
          onLoading: LoadingCard(),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: context.width,
            height: 40,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
              vertical: defaultPadding / 2,
              horizontal: defaultPadding * 2,
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(
                    disabled: controller.isMin(),
                    isLeft: false,
                    tooltip: "Before Chapter",
                    icon: Icons.arrow_back_ios_rounded,
                    marginVertical: 0,
                    onPress: () => controller.getPreviousChapter(),
                  ),
                  "Chapter ${controller.currentChapter()}"
                      .text
                      .headline4(context)
                      .make()
                      .marginSymmetric(
                        vertical: defaultMargin / 2,
                        horizontal: defaultMargin,
                      )
                      .backgroundColor(Colors.white)
                      .cornerRadius(8),
                  CircleButton(
                    disabled: controller.isMax(),
                    icon: Icons.arrow_forward_ios_rounded,
                    tooltip: "Next Chapter",
                    marginVertical: 0,
                    onPress: () => controller.getNextChapter(),
                  ),
                ],
              ).opacity(value: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
