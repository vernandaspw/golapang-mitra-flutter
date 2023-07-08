import 'package:get/get.dart';

import 'masuk_controller.dart';

class MasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasukController>(
      () => MasukController(),
    );
  }
}
