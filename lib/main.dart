import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indomic/controllers/storage_controller.dart';
import 'package:indomic/translation/translatons.dart';

import 'bindings/splash_binding.dart';
import 'routes/app_pages.dart';
import 'ui/pages/splash_page/splash_page.dart';
import 'ui/theme/app_themes.dart';

void main() async {
  // inisialisai untuk membuat database lokal bookmark
  await GetStorage.init("bookmark");
  // inisialisai untuk membuat database lokal bahasa
  await GetStorage.init('bahasa');
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
    Get.put(StorageController());
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale!.languageCode == "id"
          ? Locale("id_ID")
          : Locale("en_US"),
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      home: SplashPage(),
    );
  }
}
