import 'package:get/get.dart';

import 'dompet_kredit_topup_controller.dart';

class DompetKreditTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetKreditTopupController>(
      () => DompetKreditTopupController(),
    );
  }
}
