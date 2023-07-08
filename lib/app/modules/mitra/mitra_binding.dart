import 'package:get/get.dart';

import 'mitra_controller.dart';

class MitraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MitraController>(
      () => MitraController(),
    );
  }
}
