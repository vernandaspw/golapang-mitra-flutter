import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/mitra/mitra_controller.dart';

class MitraEditController extends GetxController {
  //TODO: Implement MitraEditController.

  var me = {}.obs;
  late TextEditingController namaC;
  late TextEditingController deskripsiC;

  var nama = ''.obs;
  var deskripsi = ''.obs;

  @override
  void onInit() {
    super.onInit();
    namaC = new TextEditingController();
    deskripsiC = new TextEditingController();
    getMe();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    namaC.dispose();
    deskripsiC.dispose();
  }

  var loadingMe = false.obs;
  void getMe() async {
    loadingMe.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/auth/me'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          me.value = res['data'];
          namaC.text = res['data']['mitra']['nama'];
          if (res['data']['mitra']['deskripsi'] != null) {
            deskripsiC.text = res['data']['mitra']['deskripsi'];
          }
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {
          return null;
        }
        loadingMe(false);
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }

  void simpan() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/mitra/update'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'nama': nama.toString(),
            'deskripsi': deskripsi.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);

          getMe();
          Get.find<MitraController>().getMe();
          update();
          Get.back();
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('daftar-masuk');
        } else {
          loadingMe(false);
          throw Exception('Terjadi kesalahan');
        }
        loadingMe(false);
      } else {
        loadingMe(false);
        throw Exception('Terjadi kesalahan');
      }
    });
  }
}
