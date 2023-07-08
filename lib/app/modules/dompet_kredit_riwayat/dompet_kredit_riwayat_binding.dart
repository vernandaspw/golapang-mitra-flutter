import 'package:get/get.dart';

import 'dompet_kredit_riwayat_controller.dart';

class DompetKreditRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetKreditRiwayatController>(
      () => DompetKreditRiwayatController(),
    );
  }
}
