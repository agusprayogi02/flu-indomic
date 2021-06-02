import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/splash_binding.dart';
import 'routes/app_pages.dart';
import 'ui/pages/splash_page/splash_page.dart';
import 'ui/theme/app_themes.dart';

void main() async {
  await GetStorage.init();
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
