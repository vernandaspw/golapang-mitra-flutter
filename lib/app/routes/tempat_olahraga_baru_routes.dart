import 'package:get/get.dart';

import '../modules/tempat_olahraga_baru/tempat_olahraga_baru_binding.dart';
import '../modules/tempat_olahraga_baru/tempat_olahraga_baru_page.dart';

class TempatOlahragaBaruRoutes {
  TempatOlahragaBaruRoutes._();

  static const tempatOlahragaBaru = '/tempat-olahraga-baru/:id';

  static final routes = [
    GetPage(
      name: tempatOlahragaBaru,
      page: () => const TempatOlahragaBaruPage(),
      binding: TempatOlahragaBaruBinding(),
    ),
  ];
}
