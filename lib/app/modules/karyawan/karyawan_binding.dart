import 'package:get/get.dart';

import 'karyawan_controller.dart';

class KaryawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KaryawanController>(
      () => KaryawanController(),
    );
  }
}
