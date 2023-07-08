import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/middlewares/StartAuthMiddleware.dart';

import '../modules/start_screen/start_screen_binding.dart';
import '../modules/start_screen/start_screen_page.dart';

class StartScreenRoutes {
  StartScreenRoutes._();

  static const startScreen = '/start-screen';

  static final routes = [
    GetPage(
      name: startScreen,
      page: () => const StartScreenPage(),
      binding: StartScreenBinding(),
      // middlewares: [StartAuthMiddleware()],
    ),
  ];
}
