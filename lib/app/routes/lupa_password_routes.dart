import 'package:get/get.dart';

import '../modules/lupa_password/lupa_password_binding.dart';
import '../modules/lupa_password/lupa_password_page.dart';

class LupaPasswordRoutes {
  LupaPasswordRoutes._();

  static const lupaPassword = '/lupa-password';

  static final routes = [
    GetPage(
      name: lupaPassword,
      page: () => const LupaPasswordPage(),
      binding: LupaPasswordBinding(),
    ),
  ];
}
