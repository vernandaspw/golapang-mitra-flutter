import 'package:get/get.dart';

import '../modules/dompet_detail/dompet_detail_binding.dart';
import '../modules/dompet_detail/dompet_detail_page.dart';

class DompetDetailRoutes {
  DompetDetailRoutes._();

  static const dompetDetail = '/dompet-detail/:id';

  static final routes = [
    GetPage(
      name: dompetDetail,
      page: () => const DompetDetailPage(),
      binding: DompetDetailBinding(),
    ),
  ];
}
