import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    Key? key,
    required this.title,
    required this.imgSrc,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String? imgSrc;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(120),
      width: getWidth(150),
      decoration: BoxDecoration(
        borderRadius: borderRadiusAll(),
        color: lightPrimaryC,
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: borderRadiusOnly(tLeft: 8, tRight: 8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imgSrc ??
                    "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png",
                placeholder: (context, url) =>
                    Image.asset("assets/gif/spinner.gif"),
              ).h(getHeight(95)).w(getWidth(150))),
          "$title"
              .text
              .maxLines(1)
              .overflow(TextOverflow.ellipsis)
              .color(textC)
              .make()
              .marginOnly(top: 3, left: 5, right: 5),
        ],
      ),
    ).onInkTap(onTap);
  }
}
