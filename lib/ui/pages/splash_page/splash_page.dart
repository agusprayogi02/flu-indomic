import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/components/loading_card.dart';
import 'package:indomic/ui/utils/utils.dart';
import '../../../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    SplashController.to.onInit();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            LoadingCard(),
            Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(defaultPadding * 1.5),
                decoration: BoxDecoration(
                  color: darkPrimaryC.withOpacity(0.5),
                  borderRadius: borderRadiusAll(),
                ),
                child: SvgPicture.asset("assets/icons/IndoMic.svg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
