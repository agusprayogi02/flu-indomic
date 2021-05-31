import 'package:get/get.dart';

double getWidth(double width) {
  double defWidth = Get.width;
  double screenWidth = defWidth > 700 ? defWidth * 0.7 : defWidth;
  // 411.42857142857144 ukuran width hp yang saya buat debug
  return (width / 411.42857142857144) * screenWidth;
}

double getHeight(double height) {
  double defHeight = Get.height;
  double screenHeight = defHeight > 1200 ? defHeight * 0.7 : defHeight;
  // 820.5714285714286 ukuran height hp yang saya buat debug
  return (height / 820.5714285714286) * screenHeight;
}
