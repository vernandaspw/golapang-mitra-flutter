import 'package:get/get.dart';

import 'tempat_detail_controller.dart';

class TempatDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatDetailController>(
      () => TempatDetailController(),
    );
  }
}
