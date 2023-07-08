import 'package:get/get.dart';

import 'tempat_foto_controller.dart';

class TempatFotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatFotoController>(
      () => TempatFotoController(),
    );
  }
}
