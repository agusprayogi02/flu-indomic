import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:indomic/controllers/storage_controller.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var to = StorageController.to;

      return Text("");
    });
  }
}
