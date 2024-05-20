import 'package:get/get.dart';

import 'package:news_finder_task/app/modules/news_details/bindings/news_details_binding.dart';
import 'package:news_finder_task/app/modules/news_details/views/news_details_view.dart';
import 'package:news_finder_task/app/modules/news_screen/bindings/news_screen_binding.dart';
import 'package:news_finder_task/app/modules/news_screen/views/news_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NEWS_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.NEWS_SCREEN,
      page: () => NewsScreenView(),
      binding: NewsScreenBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS,
      page: () => NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
  ];
}
