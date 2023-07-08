import 'package:get/get.dart';

import 'tempat_buat_controller.dart';

class TempatBuatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatBuatController>(
      () => TempatBuatController(),
    );
  }
}
