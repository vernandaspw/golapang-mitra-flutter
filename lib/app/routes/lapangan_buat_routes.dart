import 'package:get/get.dart';

import '../modules/lapangan_buat/lapangan_buat_binding.dart';
import '../modules/lapangan_buat/lapangan_buat_page.dart';

class LapanganBuatRoutes {
  LapanganBuatRoutes._();

  static const lapanganBuat = '/lapangan-buat/:id';

  static final routes = [
    GetPage(
      name: lapanganBuat,
      page: () => const LapanganBuatPage(),
      binding: LapanganBuatBinding(),
    ),
  ];
}
