import 'package:get/get.dart';

import 'premium_controller.dart';

class PremiumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PremiumController>(
      () => PremiumController(),
    );
  }
}
