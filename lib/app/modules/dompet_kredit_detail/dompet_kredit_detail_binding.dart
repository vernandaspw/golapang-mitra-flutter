import 'package:get/get.dart';

import 'dompet_kredit_detail_controller.dart';

class DompetKreditDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetKreditDetailController>(
      () => DompetKreditDetailController(),
    );
  }
}
