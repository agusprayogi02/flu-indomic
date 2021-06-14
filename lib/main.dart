import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/splash_binding.dart';
import 'routes/app_pages.dart';
import 'ui/pages/splash_page/splash_page.dart';
import 'ui/theme/app_themes.dart';

void main() async {
  // inisialisai untuk membuat database lokal bookmark
  await GetStorage.init("bookmark");
  // untuk orientasi potrait saja
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      home: SplashPage(),
    );
  }
}
