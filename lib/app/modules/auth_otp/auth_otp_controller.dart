import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/masuk/masuk_controller.dart';

class AuthOtpController extends GetxController {
  //TODO: Implement AuthOtpController.

  var loadingLogin = false.obs;

  var validateOtp;

  late TextEditingController otpC;

  var email_or_phone = ''.obs;
  var password = ''.obs;
  var otp = ''.obs;

  var code_expired_at = ''.obs;
  var code_expired_menit = ''.obs;
  var code_resend_at = ''.obs;
  var code_resend_menit = ''.obs;

  @override
  void onInit() {
    super.onInit();
    otpC = new TextEditingController();

    msg.value = Get.find<MasukController>().msg.toString();
    email_or_phone.value =
        Get.find<MasukController>().email_or_phone.toString();
    password.value = Get.find<MasukController>().password.toString();
    code_expired_at.value =
        Get.find<MasukController>().code_expired_at.toString();
    code_expired_menit.value =
        Get.find<MasukController>().code_expired_menit.toString();
    code_resend_at.value =
        Get.find<MasukController>().code_resend_at.toString();
    code_resend_menit.value =
        Get.find<MasukController>().code_resend_menit.toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    otpC.dispose();
  }

  var msg = ''.obs;
  var loadingResend = false.obs;

  void resend() async {
    loadingResend(true);
    try {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/resend'),
        body: {
          'email_or_phone': email_or_phone.toString(),
        },
      );

      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        code_expired_at.value = res['data']['code_expired_at'].toString();
        code_expired_menit.value = res['data']['code_expired_menit'].toString();
        code_resend_at.value = res['data']['code_resend_at'].toString();
        code_resend_menit.value = res['data']['code_resend_menit'].toString();
        msg.value = res['msg'];
        Get.defaultDialog(
          title: "Berhasil",
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.green,
          ),
        );
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else {
        Get.defaultDialog(
          middleText: 'Kesalahan koneksi internet',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      }
    } finally {
      loadingResend(false);
    }
  }

  void resendOtpEmail() async {
    loadingResend(true);
    try {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/resend-otp-email'),
        body: {
          'email_or_phone': email_or_phone.toString(),
        },
      );

      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        code_expired_at.value = res['data']['code_expired_at'].toString();
        code_expired_menit.value = res['data']['code_expired_menit'].toString();
        code_resend_at.value = res['data']['code_resend_at'].toString();
        code_resend_menit.value = res['data']['code_resend_menit'].toString();
        msg.value = res['msg'];
        Get.defaultDialog(
          title: "Berhasil",
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.green,
          ),
        );
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else {
        Get.defaultDialog(
          middleText: 'Kesalahan koneksi internet',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      }
    } finally {
      loadingResend(false);
    }
  }

  void resendOtpWa() async {
    loadingResend(true);
    try {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/resend-otp-wa'),
        body: {
          'email_or_phone': email_or_phone.toString(),
        },
      );

      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        code_expired_at.value = res['data']['code_expired_at'].toString();
        code_expired_menit.value = res['data']['code_expired_menit'].toString();
        code_resend_at.value = res['data']['code_resend_at'].toString();
        code_resend_menit.value = res['data']['code_resend_menit'].toString();
        msg.value = res['msg'];
        Get.defaultDialog(
          title: "Berhasil",
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.green,
          ),
        );
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else {
        Get.defaultDialog(
          middleText: 'Kesalahan koneksi internet',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      }
    } finally {
      loadingResend(false);
    }
  }

  void loginOtp() async {
    loadingLogin(true);
    try {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/login-otp'),
        body: {
          'email_or_phone': email_or_phone.toString(),
          'password': password.toString(),
          'otp': otp.toString(),
        },
      );

      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);

        // save session,  langsung ke halaman home
        Session.saveToken(res['data']['access_token']);
        Session.saveUserId(res['data']['userId']);
        Session.saveUserUuid(res['data']['userUuid'].toString());
        Session.saveUserMitraId(res['data']['userMitraId']);
        Session.saveRole(res['data']['userRole']);
        Session.saveNama(res['data']['userNama']);

        Get.offAllNamed('/home');
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      } else {
        Get.defaultDialog(
          middleText: 'Kesalahan koneksi internet',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      }
    } finally {
      loadingLogin(false);
    }
  }
}
