import 'package:get/get.dart';

import '../modules/dompet_kredit_riwayat/dompet_kredit_riwayat_binding.dart';
import '../modules/dompet_kredit_riwayat/dompet_kredit_riwayat_page.dart';

class DompetKreditRiwayatRoutes {
  DompetKreditRiwayatRoutes._();

  static const dompetKreditRiwayat = '/dompet-kredit-riwayat';

  static final routes = [
    GetPage(
      name: dompetKreditRiwayat,
      page: () => const DompetKreditRiwayatPage(),
      binding: DompetKreditRiwayatBinding(),
    ),
  ];
}
