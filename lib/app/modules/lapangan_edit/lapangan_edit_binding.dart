import 'package:get/get.dart';

import 'lapangan_edit_controller.dart';

class LapanganEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LapanganEditController>(
      () => LapanganEditController(),
    );
  }
}
