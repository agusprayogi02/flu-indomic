import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class TentangApp extends StatelessWidget {
  const TentangApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: getHeight(100),
          width: getWidth(100),
          color: lightPrimaryC,
          child: Image.asset(
            "assets/icons/icons.png",
            fit: BoxFit.cover,
          ).opacity(value: 0.9),
        ).cornerRadius(8),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Tentang Aplikasi :".text.headline5(context).make(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    "Nama".text.bodyText1(context).make(),
                    "Bahasa".text.bodyText1(context).make(),
                    "Pembuat".text.bodyText1(context).make(),
                    "Lisensi".text.bodyText1(context).make(),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    ":".text.bodyText1(context).make(),
                    ":".text.bodyText1(context).make(),
                    ":".text.bodyText1(context).make(),
                    ":".text.bodyText1(context).make(),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    "Indomic".text.bodyText1(context).make(),
                    "Indonesia dan Inggris".text.bodyText1(context).make(),
                    "Agus Prayogi".text.bodyText1(context).make(),
                    "Open Source".text.bodyText1(context).make(),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
