import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPage'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("${args.endpoint}"),
          ],
        ),
      ),
    );
  }
}
