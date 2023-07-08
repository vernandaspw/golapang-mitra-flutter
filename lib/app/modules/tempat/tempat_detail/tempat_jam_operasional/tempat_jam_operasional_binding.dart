import 'package:get/get.dart';

import 'tempat_jam_operasional_controller.dart';

class TempatJamOperasionalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatJamOperasionalController>(
      () => TempatJamOperasionalController(),
    );
  }
}
