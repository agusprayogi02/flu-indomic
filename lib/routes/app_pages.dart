import 'package:get/get.dart';
import 'package:indomic/bindings/home_binding.dart';
import 'package:indomic/bindings/splash_binding.dart';
import 'package:indomic/ui/pages/home_page/home_page.dart';
import 'package:indomic/ui/pages/splash_page/splash_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
