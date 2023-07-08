import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';

class MasukController extends GetxController {
  //TODO: Implement MasukController.
  var isLoading = false.obs;
  var hidden = false.obs;

  late TextEditingController email_or_phoneC;
  late TextEditingController passC;

  var validatePhone, validatePassword, validateUrl;

  @override
  void onInit() {
    super.onInit();
    email_or_phoneC = new TextEditingController();
    passC = new TextEditingController();

    getSetting();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    email_or_phoneC.dispose();
    passC.dispose();
  }

  var setting = {}.obs;
  void getSetting() async {
    final response = await Api.client.get(
      Uri.parse(Api.url + 'setting'),
    );

    if (response.statusCode == 200) {
      // jika berhasi save session
      var res = jsonDecode(response.body);
      setting.value = res['data'];
      settingPassword();
    } else if (response.statusCode == 401) {
      var res = jsonDecode(response.body);
    } else {
      var res = jsonDecode(response.body);
    }
  }

  var showPassword = true.obs;
  void settingPassword() async {
    if (setting['mitra_otp'] == 1) {
      if (setting['mitra_password'] == 1) {
        showPassword(true);
      } else {
        showPassword(false);
      }
    } else {
      showPassword(true);
    }
  }

  var email_or_phone = ''.obs;
  var password = ''.obs;

  var loadingLogin = false.obs;

  var code_expired_at = ''.obs;
  var code_expired_menit = ''.obs;
  var code_resend_at = ''.obs;
  var code_resend_menit = ''.obs;
  var msg = ''.obs;
  void login() async {
    // validasi
    loadingLogin(true);
    if (email_or_phone.isEmpty) {
      Get.defaultDialog(
        middleText: 'Email / No Whatsapp Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
      loadingLogin(false);
      return null;
    }

    if (setting['mitra_otp'] == 1) {
      if (setting['mitra_password'] == 1) {
        if (password.isEmpty) {
          Get.defaultDialog(
            middleText: 'Password Wajib diisi!',
            titleStyle: TextStyle(
              color: Colors.red,
            ),
          );
          loadingLogin(false);
          return null;
        }
      }
    } else {
      if (password.isEmpty) {
        Get.defaultDialog(
          middleText: 'Password Wajib diisi!',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
        loadingLogin(false);
        return null;
      }
    }

    try {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/login'),
        body: {
          'email_or_phone': email_or_phone.toString(),
          'password': password.toString(),
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);

        if (res['data']['access_token'] == null) {
          //  ke halaman otp

          msg.value = res['msg'].toString();
          code_expired_at.value = res['data']['code_expired_at'].toString();
          code_expired_menit.value =
              res['data']['code_expired_menit'].toString();
          code_resend_at.value = res['data']['code_resend_at'].toString();
          code_resend_menit.value = res['data']['code_resend_menit'].toString();
          Get.toNamed('auth-otp');
        } else {
          // save session,  langsung ke halaman home
          Session.saveToken(res['data']['access_token']);
          Session.saveUserId(res['data']['userId']);
          Session.saveUserUuid(res['data']['userUuid'].toString());
          Session.saveUserMitraId(res['data']['userMitraId']);
          Session.saveRole(res['data']['userRole']);
          Session.saveNama(res['data']['userNama']);

          Get.offAllNamed('/home');
        }
        loadingLogin(false);
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
        loadingLogin(false);
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
        loadingLogin(false);
      } else {
        Get.defaultDialog(
          middleText: 'Kesalahan koneksi lambat',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
        loadingLogin(false);
      }
      loadingLogin(false);
    } catch (e) {
      Get.defaultDialog(
        middleText: 'Kesalahan koneksi lambat',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
      loadingLogin(false);
    } finally {
      loadingLogin(false);
    }
  }
}
