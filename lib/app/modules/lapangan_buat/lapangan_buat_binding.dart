import 'package:get/get.dart';

import 'lapangan_buat_controller.dart';

class LapanganBuatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LapanganBuatController>(
      () => LapanganBuatController(),
    );
  }
}
