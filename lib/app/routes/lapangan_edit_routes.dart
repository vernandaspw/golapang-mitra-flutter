import 'package:get/get.dart';

import '../modules/lapangan_edit/lapangan_edit_binding.dart';
import '../modules/lapangan_edit/lapangan_edit_page.dart';

class LapanganEditRoutes {
  LapanganEditRoutes._();

  static const lapanganEdit = '/lapangan-edit/:id/:lapanganid';

  static final routes = [
    GetPage(
      name: lapanganEdit,
      page: () => const LapanganEditPage(),
      binding: LapanganEditBinding(),
    ),
  ];
}
