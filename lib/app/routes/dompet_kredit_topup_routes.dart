import 'package:get/get.dart';

import '../modules/dompet_kredit_topup/dompet_kredit_topup_binding.dart';
import '../modules/dompet_kredit_topup/dompet_kredit_topup_page.dart';

class DompetKreditTopupRoutes {
  DompetKreditTopupRoutes._();

  static const dompetKreditTopup = '/dompet-kredit-topup';

  static final routes = [
    GetPage(
      name: dompetKreditTopup,
      page: () => const DompetKreditTopupPage(),
      binding: DompetKreditTopupBinding(),
    ),
  ];
}
