import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/middlewares/AuthMiddleware.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
