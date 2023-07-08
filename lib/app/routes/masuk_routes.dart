import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/middlewares/AuthLogedMiddleware.dart';
import 'package:golapang_mitra/app/data/middlewares/AuthMiddleware.dart';

import '../modules/masuk/masuk_binding.dart';
import '../modules/masuk/masuk_page.dart';

class MasukRoutes {
  MasukRoutes._();

  static const masuk = '/masuk';

  static final routes = [
    GetPage(
      name: masuk,
      page: () => const MasukPage(),
      binding: MasukBinding(),
      middlewares: [AuthLogedMiddleware()],
    ),
  ];
}
