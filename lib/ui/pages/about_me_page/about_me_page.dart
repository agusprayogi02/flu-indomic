import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/about_me_controller.dart';

class AboutMePage extends GetView<AboutMeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: SafeArea(
        child: Text('AboutMeController'),
      ),
    );
  }
}
