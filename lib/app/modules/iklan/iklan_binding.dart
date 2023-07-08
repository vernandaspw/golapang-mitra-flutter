import 'package:get/get.dart';

import 'iklan_controller.dart';

class IklanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IklanController>(
      () => IklanController(),
    );
  }
}
