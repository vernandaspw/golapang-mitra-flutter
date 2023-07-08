import 'package:get/get.dart';

import '../modules/dompet_riwayat/dompet_riwayat_binding.dart';
import '../modules/dompet_riwayat/dompet_riwayat_page.dart';

class DompetRiwayatRoutes {
  DompetRiwayatRoutes._();

  static const dompetRiwayat = '/dompet-riwayat';

  static final routes = [
    GetPage(
      name: dompetRiwayat,
      page: () => const DompetRiwayatPage(),
      binding: DompetRiwayatBinding(),
    ),
  ];
}
