import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/pages/home_page/components/thumbnail_card.dart';

import '../../../../controllers/list_category_controller.dart';

class Body extends GetView<ListCategoryController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Container(
          child: Column(
            children: [
              ThumbnailCard(
                onPress: () {},
                title: "Updater",
                chapter: "Chapter 122",
                lastUpdated: "10 menit",
                imgSrc:
                    "https://cover.komiku.id/wp-content/uploads/2021/04/Komik-Updater.png?resize=450,235&quality=60",
              )
            ],
          ),
        ),
        Text("Coba 2"),
        Text("Coba 3"),
      ],
    );
  }
}
