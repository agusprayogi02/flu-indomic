import 'package:flutter/material.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ListGenre extends StatelessWidget {
  const ListGenre({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DetailModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  color: greyC,
                  borderRadius: borderRadiusAll(radius: 5),
                ),
                child: item.genreName.text
                    .bodyText1(context)
                    .color(darkPrimaryC)
                    .make(),
              );
            },
          ),
        ),
      ],
    );
  }
}
