import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';

class TempatEditController extends GetxController {
  //TODO: Implement TempatEditController.
  late TextEditingController namaC;
  late TextEditingController deskripsiC;
  late TextEditingController telpC;

  var id = ''.obs;
  var nama = ''.obs;
  var deskripsi = ''.obs;
  var telp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    namaC = new TextEditingController();
    deskripsiC = new TextEditingController();
    telpC = new TextEditingController();
    id.value = Get.parameters['id'].toString();
    getTempat();
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
    telpC.dispose();
  }

  var tempat = {}.obs;
  var loadingTempat = false.obs;

  void getTempat() async {
    loadingTempat.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.get(
          Uri.parse(Api.url + 'mitra/tempat?id=${id}'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          tempat.value = res['data'];
          // print(res['data']);

          if (res['data']['nama'] != null) {
            namaC.text = res['data']['nama'].toString();
          }

          if (res['data']['deskripsi'] != null) {
            deskripsiC.text = res['data']['deskripsi'].toString();
          }

          if (res['data']['telp'] != null) {
            telpC.text = res['data']['telp'].toString();
          }

          loadingTempat.value = false;
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {
          loadingTempat.value = false;
          print('error');
        }
        loadingTempat.value = false;
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }

  void simpan() async {
    loadingTempat.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/update/info'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': id.toString(),
            'nama': namaC.text,
            'deskripsi': deskripsiC.text,
            'telp': telpC.text,
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          getTempat();
          Get.find<TempatDetailController>().getTempat();
          update();
          Get.back();
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('daftar-masuk');
        } else {
          loadingTempat(false);
          throw Exception('Terjadi kesalahan');
        }
        loadingTempat(false);
      } else {
        loadingTempat(false);
        throw Exception('Terjadi kesalahan');
      }
    });
  }
}
