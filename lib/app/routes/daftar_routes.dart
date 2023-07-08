import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/middlewares/AuthLogedMiddleware.dart';
import 'package:golapang_mitra/app/data/middlewares/AuthMiddleware.dart';

import '../modules/daftar/daftar_binding.dart';
import '../modules/daftar/daftar_page.dart';

class DaftarRoutes {
  DaftarRoutes._();

  static const daftar = '/daftar';

  static final routes = [
    GetPage(
      name: daftar,
      page: () => const DaftarPage(),
      binding: DaftarBinding(),
       middlewares: [AuthLogedMiddleware()],
    ),
  ];
}
