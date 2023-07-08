import 'package:get/get.dart';

import 'tempat_edit_controller.dart';

class TempatEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempatEditController>(
      () => TempatEditController(),
    );
  }
}
