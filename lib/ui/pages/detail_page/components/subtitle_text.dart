import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    Key? key,
    required this.subTitle,
    required this.title,
  }) : super(key: key);

  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "$title\t\t\t:\t\t\t"
            .text
            .headline6(context)
            .fontWeight(FontWeight.w500)
            .white
            .maxLines(1)
            .ellipsis
            .make(),
        subTitle.text
            .headline6(context)
            .fontWeight(FontWeight.w700)
            .white
            .maxLines(1)
            .ellipsis
            .make()
            .w(context.safePercentWidth * (title == "Author" ? 70 : 50)),
      ],
    );
  }
}
