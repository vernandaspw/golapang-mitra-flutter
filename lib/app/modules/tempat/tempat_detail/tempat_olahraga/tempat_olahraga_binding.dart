import 'package:get/get.dart';

import 'tempat_olahraga_controller.dart';

class TempatOlahragaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatOlahragaController>(
      () => TempatOlahragaController(),
    );
  }
}
