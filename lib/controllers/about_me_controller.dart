import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/utils/utils.dart';

class AboutMeController extends GetxController {
  static AboutMeController get to => Get.find();

  showDonate() {
    Get.dialog(
      AlertDialog(
        titlePadding: EdgeInsets.all(defaultPadding * 1.5),
        title: Text("Scan barcode dengan aplikasi OVO anda!"),
        contentPadding: EdgeInsets.all(defaultPadding * 1.5),
        content: Image.asset(
          "assets/images/barcode_ovo.jpg",
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        scrollable: true,
        actions: <Widget>[
          Center(
            child: IconButton(
              color: primaryC,
              splashColor: Colors.black,
              icon: Icon(
                Icons.close,
                color: primaryC,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
