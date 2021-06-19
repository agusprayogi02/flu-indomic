import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indomic/ui/components/circle_button.dart';
import 'package:indomic/ui/utils/config_size.dart';
import 'package:indomic/ui/utils/utils.dart';
import 'package:share/share.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import 'custom_button.dart';
import 'tentang_app.dart';
import 'top_widget.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopWidget(),
        TentangApp()
            .paddingAll(defaultPadding)
            .backgroundColor(greyC)
            .cornerRadius(8)
            .marginAll(defaultMargin * 1.5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin * 1.5),
          child: Column(
            children: [
              Divider(
                thickness: 1,
              ),
              CustomButton(
                icon: Icons.share_rounded,
                title: "Share Aplikasi",
                onTap: () =>
                    Share.share("Aku Bos!", subject: 'Download App Indomic'),
              ),
              Divider(
                thickness: 1,
              ),
              CustomButton(
                icon: Icons.monetization_on_rounded,
                title: "Donasi via OVO",
                onTap: () async {
                  await Get.dialog(
                    AlertDialog(
                      titlePadding: EdgeInsets.all(defaultPadding * 1.5),
                      title:
                          "Scan barcode dengan aplikasi OVO anda!".text.make(),
                      contentPadding: EdgeInsets.all(defaultPadding * 1.5),
                      content: Image.asset(
                        "assets/images/barcode_ovo.jpg",
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                      scrollable: true,
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
        Spacer(),
        "dikembangankan oleh :".text.headline5(context).make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pp.jpg",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ).h(100).w(100).cornerRadius(50).opacity(value: 0.9),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Agus Prayogi".text.headline3(context).make(),
                "agus.apy#6177 ~ Discord".text.size(15).make(),
              ],
            )
          ],
        ).marginAll(defaultMargin * 1.5)
      ],
    );
  }
}
