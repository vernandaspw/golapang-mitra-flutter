import 'package:get/get.dart';

import '../modules/karyawan/karyawan_binding.dart';
import '../modules/karyawan/karyawan_page.dart';

class KaryawanRoutes {
  KaryawanRoutes._();

  static const karyawan = '/karyawan';

  static final routes = [
    GetPage(
      name: karyawan,
      page: () => const KaryawanPage(),
      binding: KaryawanBinding(),
    ),
  ];
}
