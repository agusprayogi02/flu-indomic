import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/routes/app_pages.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class ListChapter extends StatelessWidget {
  const ListChapter({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DetailModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.chapter!.length,
        itemBuilder: (context, index) {
          var chapter = data.chapter![index];
          return Container(
            padding: EdgeInsets.all(defaultPadding * 1.5),
            margin: EdgeInsets.all(defaultMargin),
            decoration:
                BoxDecoration(color: greyC, borderRadius: borderRadiusAll()),
            child: "${chapter.chapterTitle}".text.headline6(context).make(),
          ).onTap(() {
            Get.toNamed(Routes.CHAPTER, arguments: chapter);
          });
        },
      ),
    );
  }
}
