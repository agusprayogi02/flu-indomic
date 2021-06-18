import 'package:get/get.dart';
import 'package:indomic/bindings/about_me_binding.dart';
import 'package:indomic/bindings/bookmark_binding.dart';
import 'package:indomic/bindings/chapter_binding.dart';
import 'package:indomic/bindings/detail_binding.dart';
import 'package:indomic/bindings/home_binding.dart';
import 'package:indomic/bindings/list_category_binding.dart';
import 'package:indomic/bindings/master_binding.dart';
import 'package:indomic/bindings/search_binding.dart';
import 'package:indomic/bindings/splash_binding.dart';
import 'package:indomic/ui/pages/about_me_page/about_me_page.dart';
import 'package:indomic/ui/pages/bookmark_page/bookmark_page.dart';
import 'package:indomic/ui/pages/chapter_page/chapter_page.dart';
import 'package:indomic/ui/pages/detail_page/detail_page.dart';
import 'package:indomic/ui/pages/home_page/home_page.dart';
import 'package:indomic/ui/pages/list_category_page/list_category_page.dart';
import 'package:indomic/ui/pages/master_page/master_page.dart';
import 'package:indomic/ui/pages/search_page/search_page.dart';
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
        SearchBinding(),
        BookmarkBinding(),
      ],
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.CHAPTER,
      page: () => ChapterPage(),
      binding: ChapterBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
    ),
    GetPage(
      name: Routes.BOOKMARK,
      page: () => BookmarkPage(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: Routes.ABOUT_ME,
      page: () => AboutMePage(),
      binding: AboutMeBinding(),
    ),
  ];
}
