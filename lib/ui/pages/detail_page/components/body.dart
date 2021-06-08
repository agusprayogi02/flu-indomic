import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/detail_controller.dart';
import 'package:indomic/ui/components/icon_rounded.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/pages/detail_page/components/subtitle_text.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

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
              CachedNetworkImage(
                imageUrl: data.thumb,
                fit: BoxFit.cover,
              ).w(Get.height).opacity75(),
              Positioned(
                top: getHeight(270),
                child: Container(
                  height: context.percentHeight * 55,
                  width: Get.width,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: darkPrimaryC.withOpacity(0.97),
                        spreadRadius: 100,
                        blurRadius: 100,
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
                          .ellipsis
                          .white
                          .make(),
                      Divider(),
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
                      Divider(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: data.synopsis.text
                              .headline6(context)
                              .fontWeight(FontWeight.w500)
                              .white
                              .make(),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Genre"
                              .text
                              .headline5(context)
                              .white
                              .make()
                              .paddingSymmetric(vertical: 10),
                          SizedBox(
                            height: 35,
                            width: context.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.genreList!.length,
                              itemBuilder: (context, index) {
                                var item = data.genreList![index];
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                    right: defaultMargin,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: borderRadiusAll(radius: 5),
                                  ),
                                  child: item.genreName.text
                                      .bodyText1(context)
                                      .make(),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ).paddingSymmetric(
                    horizontal: defaultPadding,
                  ),
                ),
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
                  icon: Icons.bookmark,
                  onPress: () {},
                ),
              ),
            ],
          ).h(context.safePercentHeight * 100);
        }
        return Text("Internet Error !");
      }
    });
  }
}
