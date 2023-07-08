import 'package:get/get.dart';

import '../modules/dompet_kredit_detail/dompet_kredit_detail_binding.dart';
import '../modules/dompet_kredit_detail/dompet_kredit_detail_page.dart';

class DompetKreditDetailRoutes {
  DompetKreditDetailRoutes._();

  static const dompetKreditDetail = '/dompet-kredit-detail/:id';

  static final routes = [
    GetPage(
      name: dompetKreditDetail,
      page: () => const DompetKreditDetailPage(),
      binding: DompetKreditDetailBinding(),
    ),
  ];
}
