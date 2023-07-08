import 'package:get/get.dart';

import 'dompet_riwayat_controller.dart';

class DompetRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetRiwayatController>(
      () => DompetRiwayatController(),
    );
  }
}
