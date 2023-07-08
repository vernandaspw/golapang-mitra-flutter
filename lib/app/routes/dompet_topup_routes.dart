import 'package:get/get.dart';

import '../modules/dompet_topup/dompet_topup_binding.dart';
import '../modules/dompet_topup/dompet_topup_page.dart';

class DompetTopupRoutes {
  DompetTopupRoutes._();

  static const dompetTopup = '/dompet-topup';

  static final routes = [
    GetPage(
      name: dompetTopup,
      page: () => const DompetTopupPage(),
      binding: DompetTopupBinding(),
    ),
  ];
}
