import 'package:get/get.dart';

import 'start_screen_controller.dart';

class StartScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<StartScreenController>(
    //   () => StartScreenController(),
    // );
    Get.put<StartScreenController>(
      StartScreenController(),
    );
  }
}
