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
      height: getHeight(100),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Colors.grey[200],
        borderRadius: borderRadiusAll(),
      ),
      child: Row(
        children: [
          SizedBox(
            height: getHeight(100),
            width: getWidth(75),
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: "assets/gif/ripple.gif",
              image: "$imgSrc",
            ).cornerRadius(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$title"
                  .text
                  .headline5(context)
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
                  .gray600
                  .make(),
              Spacer(),
              "$lastUpdated yang lalu"
                  .text
                  .subtitle2(context)
                  .overflow(TextOverflow.ellipsis)
                  .maxLines(1)
                  .gray500
                  .make(),
            ],
          )
              .marginOnly(
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin,
              )
              .w(getWidth(110)),
        ],
      ),
    ).onInkTap(onPress);
  }
}
