import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/gif/spinner.gif'),
                  ),
                  "Loading ...".text.headline4(context).make(),
                ],
              ),
            ),
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
