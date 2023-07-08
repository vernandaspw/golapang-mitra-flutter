import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/middlewares/AuthLogedMiddleware.dart';
import 'package:golapang_mitra/app/data/middlewares/AuthMiddleware.dart';

import '../modules/daftar_masuk/daftar_masuk_binding.dart';
import '../modules/daftar_masuk/daftar_masuk_page.dart';

class DaftarMasukRoutes {
  DaftarMasukRoutes._();

  static const daftarMasuk = '/daftar-masuk';

  static final routes = [
    GetPage(
      name: daftarMasuk,
      page: () => const DaftarMasukPage(),
      binding: DaftarMasukBinding(),
      middlewares: [AuthLogedMiddleware()],
    ),
  ];
}
