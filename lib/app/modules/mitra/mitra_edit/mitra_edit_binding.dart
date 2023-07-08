import 'package:get/get.dart';

import 'mitra_edit_controller.dart';

class MitraEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MitraEditController>(
      () => MitraEditController(),
    );
  }
}
