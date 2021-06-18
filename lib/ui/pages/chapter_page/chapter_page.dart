import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/chapter_controller.dart';
import 'components/body.dart';

class ChapterPage extends GetView<ChapterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Obx(
          () => Text('${controller.title()}'),
        ),
      ),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
