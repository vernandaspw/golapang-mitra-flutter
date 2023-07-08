import 'package:get/get.dart';

import '../modules/premium/premium_binding.dart';
import '../modules/premium/premium_page.dart';

class PremiumRoutes {
  PremiumRoutes._();

  static const premium = '/premium';

  static final routes = [
    GetPage(
      name: premium,
      page: () => const PremiumPage(),
      binding: PremiumBinding(),
    ),
  ];
}
