import 'package:get/get.dart';
import 'package:indomic/bindings/home_binding.dart';
import 'package:indomic/bindings/list_category_binding.dart';
import 'package:indomic/bindings/master_binding.dart';
import 'package:indomic/bindings/splash_binding.dart';
import 'package:indomic/ui/pages/home_page/home_page.dart';
import 'package:indomic/ui/pages/list_category_page/list_category_page.dart';
import 'package:indomic/ui/pages/master_page/master_page.dart';
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
    GetPage(
      name: Routes.LIST,
      page: () => ListCategoryPage(),
      binding: ListCategoryBinding(),
    ),
    GetPage(
      name: Routes.MASTER,
      page: () => MasterPage(),
      bindings: [
        MasterBinding(),
        HomeBinding(),
        ListCategoryBinding(),
      ],
    ),
  ];
}
