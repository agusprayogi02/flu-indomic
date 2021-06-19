import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/about_me_controller.dart';
import 'components/body.dart';

class AboutMePage extends GetView<AboutMeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
