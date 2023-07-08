import 'package:get/get.dart';

import 'daftar_masuk_controller.dart';

class DaftarMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarMasukController>(
      () => DaftarMasukController(),
    );
  }
}
