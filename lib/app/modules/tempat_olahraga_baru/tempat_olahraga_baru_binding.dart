import 'package:get/get.dart';

import 'tempat_olahraga_baru_controller.dart';

class TempatOlahragaBaruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatOlahragaBaruController>(
      () => TempatOlahragaBaruController(),
    );
  }
}
