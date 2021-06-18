import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ThumbnailCard extends StatelessWidget {
  const ThumbnailCard({
    Key? key,
    required this.onPress,
    required this.title,
    this.chapter,
    required this.lastUpdated,
    required this.imgSrc,
    this.isMangaType = false,
    this.type,
    required this.btnIcon,
    this.btnPress,
    this.btnColor,
    this.totalChapter = 0,
  }) : super(key: key);

  final Function() onPress;
  final String title;
  final String? chapter;
  final String lastUpdated;
  final String imgSrc;
  final bool isMangaType;
  final String? type;
  final IconData btnIcon;
  final Function()? btnPress;
  final Color? btnColor;
  final int totalChapter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(80),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Colors.grey[200],
        borderRadius: borderRadiusAll(),
      ),
      child: Row(
        children: [
          SizedBox(
            height: getHeight(80),
            width: getWidth(100),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Image.asset("assets/gif/ripple.gif"),
              imageUrl: imgSrc,
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/Default_Image_Thumbnail.png",
                fit: BoxFit.cover,
              ),
            ).cornerRadius(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "$title"
                    .text
                    .headline6(context)
                    .fontFamily("Poppins")
                    .overflow(TextOverflow.ellipsis)
                    .maxLines(1)
                    .make(),
                "${isMangaType ? type : chapter}"
                    .text
                    .subtitle1(context)
                    .overflow(TextOverflow.ellipsis)
                    .maxLines(1)
                    .gray700
                    .make(),
                Spacer(),
                if (lastUpdated != "")
                  "$lastUpdated yang lalu"
                      .text
                      .subtitle2(context)
                      .overflow(TextOverflow.ellipsis)
                      .maxLines(1)
                      .gray600
                      .make(),
                if (totalChapter != 0)
                  "$totalChapter Chapter"
                      .text
                      .subtitle2(context)
                      .overflow(TextOverflow.ellipsis)
                      .maxLines(1)
                      .white
                      .make()
                      .paddingAll(defaultPadding / 2)
                      .backgroundColor(greyDarkC),
              ],
            ).marginOnly(
              left: defaultMargin,
              bottom: defaultMargin,
            ),
          ),
          CircleButton(
            icon: btnIcon,
            tooltip: "",
            onPress: btnPress ?? onPress,
            color: btnColor,
            isLeft: false,
          ),
        ],
      ),
    ).onInkTap(onPress);
  }
}
