import 'package:get/get.dart';

import 'dompet_topup_controller.dart';

class DompetTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetTopupController>(
      () => DompetTopupController(),
    );
  }
}
