import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/detail_controller.dart';
import 'package:indomic/ui/components/icon_rounded.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/components/rounded_button.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import 'list_chapter.dart';
import 'list_genre.dart';
import 'subtitle_text.dart';

class Body extends GetView<DetailController> {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var to = DetailController.to;
      if (to.isLoading()) {
        return LoadingCard();
      } else {
        if (to.isError.isFalse) {
          var data = to.data();
          return Stack(
            children: [
              Positioned(
                top: 0,
                child: CachedNetworkImage(
                  placeholder: (context, url) => LoadingCard(
                    text: false,
                    image: 0,
                  ),
                  imageUrl: data.thumb,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/Default_Image_Thumbnail.png"),
                ).w(Get.width),
              ),
              Column(
                children: [
                  Spacer(),
                  Container(
                    height: context.safePercentHeight * 60,
                    width: Get.width,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: primaryC.withOpacity(0.97),
                          spreadRadius: 50,
                          blurRadius: 50,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.title.text
                            .headline4(context)
                            .maxLines(1)
                            .white
                            .ellipsis
                            .make(),
                        Divider(
                          color: textC,
                        ),
                        SubtitleText(
                          title: "Status",
                          subTitle: data.status,
                        ),
                        SubtitleText(
                          title: "Author",
                          subTitle: data.author,
                        ),
                        SubtitleText(
                          title: "Total Chapter",
                          subTitle: (data.chapter!.length + 1).toString(),
                        ),
                        SubtitleText(
                          title: "Type",
                          subTitle: data.type,
                        ),
                        Divider(
                          color: textC,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: data.synopsis.text
                                .headline6(context)
                                .fontWeight(FontWeight.w500)
                                .white
                                .make(),
                          ),
                        ),
                        ListGenre(data: data),
                      ],
                    ).paddingSymmetric(
                      horizontal: defaultPadding,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
                    margin: EdgeInsets.only(top: defaultMargin),
                    width: context.width,
                    height: getHeight(50),
                    decoration: BoxDecoration(
                      color: textC,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButton(
                          title: "List Chapter",
                          icon: Icons.list_alt,
                          onPress: () {
                            Get.bottomSheet(
                              ListChapter(data: data),
                              backgroundColor: Colors.white,
                            );
                          },
                        ),
                        RoundedButton(
                          title: "Start Reading",
                          icon: Icons.menu_book_rounded,
                          onPress: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconRounded(
                  icon: Icons.arrow_back,
                  onPress: () {
                    Get.back();
                  },
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconRounded(
                  icon: Icons.bookmark_added_rounded,
                  onPress: () {},
                ),
              ),
            ],
          );
        } else {
          return "Internet Error !\nTap to Refresh"
              .text
              .headline4(context)
              .makeCentered()
              .onTap(
                () => to.getDetailKomic(),
              );
        }
      }
    });
  }
}