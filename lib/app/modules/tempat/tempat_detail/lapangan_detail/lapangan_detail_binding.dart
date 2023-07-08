import 'package:get/get.dart';

import 'lapangan_detail_controller.dart';

class LapanganDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LapanganDetailController>(
      () => LapanganDetailController(),
    );
  }
}
