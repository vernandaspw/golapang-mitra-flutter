import 'package:get/get.dart';

import '../modules/dompet_tarik/dompet_tarik_binding.dart';
import '../modules/dompet_tarik/dompet_tarik_page.dart';

class DompetTarikRoutes {
  DompetTarikRoutes._();

  static const dompetTarik = '/dompet-tarik';

  static final routes = [
    GetPage(
      name: dompetTarik,
      page: () => const DompetTarikPage(),
      binding: DompetTarikBinding(),
    ),
  ];
}
