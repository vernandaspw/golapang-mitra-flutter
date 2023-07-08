import 'package:get/get.dart';

import 'tempat_controller.dart';

class TempatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatController>(
      () => TempatController(),
    );
  }
}
