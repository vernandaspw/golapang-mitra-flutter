import 'package:get/get.dart';

import '../modules/iklan/iklan_binding.dart';
import '../modules/iklan/iklan_page.dart';

class IklanRoutes {
  IklanRoutes._();

  static const iklan = '/iklan';

  static final routes = [
    GetPage(
      name: iklan,
      page: () => const IklanPage(),
      binding: IklanBinding(),
    ),
  ];
}
