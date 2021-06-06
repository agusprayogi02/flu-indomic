import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomic/ui/components/loading_card.dart';
import '../../../controllers/splash_controller.dart';
import 'package:velocity_x/velocity_x.dart';

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
              bottom: 0,
              child: "Indomic"
                  .text
                  .headline2(context)
                  .fontFamily('Poppins')
                  .makeCentered()
                  .marginOnly(bottom: 20),
            )
          ],
        ),
      ),
    );
  }
}
