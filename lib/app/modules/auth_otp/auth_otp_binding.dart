import 'package:get/get.dart';

import 'auth_otp_controller.dart';

class AuthOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthOtpController>(
      () => AuthOtpController(),
    );
  }
}
