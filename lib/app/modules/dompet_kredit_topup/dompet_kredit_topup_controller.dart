import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/home/home_controller.dart';

class DompetKreditTopupController extends GetxController {
  //TODO: Implement DompetKreditTopupController.

  late TextEditingController nominalC;

  var saldo = 0.obs;
  var nominal = 0.obs;

  @override
  void onInit() {
    super.onInit();
    nominalC = new TextEditingController();

    saldo.value =
        double.parse(Get.find<HomeController>().me['mitra']['saldo']).toInt();
    // getSetting();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nominalC.dispose();
  }

  var loadingData = false.obs;

  var loadingIsi = false.obs;
  void isi() async {
    loadingIsi(true);

    if (nominal.toString().isEmpty || nominal == 0) {
      Get.defaultDialog(title: 'gagal', middleText: 'Nominal wajib di isi');
      loadingIsi(false);
    } else {
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/saldo-kredit/topup'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'nominal': nominal.toString(),
            },
          );
          // print(response.body);
          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);
            Get.find<HomeController>().getMe();
            Get.offNamed('/dompet-kredit-detail/${res['data']['id']}');
            loadingIsi(false);
          } else if (response.statusCode == 401) {
            Session.removeAllSession();
            Get.offAllNamed('/daftar-masuk');
          } else if (response.statusCode == 422) {
            var res = jsonDecode(response.body);
            Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
            loadingIsi(false);
          } else {
            var res = jsonDecode(response.body);
            Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
            loadingIsi(false);
          }
          loadingIsi(false);
        } else {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        }
      });
    }
  }
}
