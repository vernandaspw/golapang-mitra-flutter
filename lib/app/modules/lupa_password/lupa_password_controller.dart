import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';

class LupaPasswordController extends GetxController {
  //TODO: Implement LupaPasswordController.
  late TextEditingController email_or_phoneC;

  var email_or_phone = ''.obs;

  @override
  void onInit() {
    super.onInit();
    email_or_phoneC = new TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    email_or_phoneC.dispose();
  }

  var loadingKirim = false.obs;
  void kirim() async {
    loadingKirim(true);
    if (email_or_phone.isEmpty) {
      Get.defaultDialog(
        middleText: 'Email / No Whatsapp Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
      loadingKirim(false);
      return null;
    }
    try {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/lupa-password'),
        body: {
          'email_or_phone': email_or_phone.toString(),
        },
      );

      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          title: 'Berhasil',
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.green,
          ),
          textCancel: '    Oke    ',
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
      } else {
        Get.defaultDialog(
          middleText: 'Kesalahan koneksi internet',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      }
    } finally {
      loadingKirim(false);
    }
  }
}
