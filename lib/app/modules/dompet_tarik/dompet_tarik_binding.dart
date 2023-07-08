import 'package:get/get.dart';

import 'dompet_tarik_controller.dart';

class DompetTarikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetTarikController>(
      () => DompetTarikController(),
    );
  }
}
