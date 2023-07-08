import 'package:get/get.dart';

import 'dompet_detail_controller.dart';

class DompetDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DompetDetailController>(
      () => DompetDetailController(),
    );
  }
}
