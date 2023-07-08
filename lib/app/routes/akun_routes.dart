import 'package:get/get.dart';

import '../modules/akun/akun_binding.dart';
import '../modules/akun/akun_page.dart';

class AkunRoutes {
  AkunRoutes._();

  static const akun = '/akun';

  static final routes = [
    GetPage(
      name: akun,
      page: () => const AkunPage(),
      binding: AkunBinding(),
    ),
  ];
}
