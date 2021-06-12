import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/controllers/detail_controller.dart';
import 'components/body.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    // print(Get.height - getHeight(200));
    return Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
