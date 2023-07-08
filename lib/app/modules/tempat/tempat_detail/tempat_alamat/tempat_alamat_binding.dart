import 'package:get/get.dart';

import 'tempat_alamat_controller.dart';

class TempatAlamatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatAlamatController>(
      () => TempatAlamatController(),
    );
  }
}
