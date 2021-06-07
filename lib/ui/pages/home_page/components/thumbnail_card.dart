import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ThumbnailCard extends StatelessWidget {
  const ThumbnailCard({
    Key? key,
    required this.onPress,
    required this.title,
    required this.chapter,
    required this.lastUpdated,
    required this.imgSrc,
  }) : super(key: key);

  final Function() onPress;
  final String title;
  final String chapter;
  final String lastUpdated;
  final String imgSrc;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$title"
                  .text
                  .headline6(context)
                  .fontFamily("Poppins")
                  .overflow(TextOverflow.ellipsis)
                  .maxLines(1)
                  .black
                  .make(),
              "$chapter"
                  .text
                  .subtitle1(context)
                  .overflow(TextOverflow.ellipsis)
                  .maxLines(1)
                  .gray700
                  .make(),
              Spacer(),
              "$lastUpdated yang lalu"
                  .text
                  .subtitle2(context)
                  .overflow(TextOverflow.ellipsis)
                  .maxLines(1)
                  .gray600
                  .make(),
            ],
          )
              .marginOnly(
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin,
              )
              .w(Get.width * 0.69),
        ],
      ),
    ).onInkTap(onPress);
  }
}
