import 'package:get/get.dart';

import 'tempat_fasilitas_controller.dart';

class TempatFasilitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatFasilitasController>(
      () => TempatFasilitasController(),
    );
  }
}
