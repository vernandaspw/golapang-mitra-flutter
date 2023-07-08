import 'package:get/get.dart';

import '../modules/auth_otp/auth_otp_binding.dart';
import '../modules/auth_otp/auth_otp_page.dart';

class AuthOtpRoutes {
  AuthOtpRoutes._();

  static const authOtp = '/auth-otp';

  static final routes = [
    GetPage(
      name: authOtp,
      page: () => const AuthOtpPage(),
      binding: AuthOtpBinding(),
    ),
  ];
}
