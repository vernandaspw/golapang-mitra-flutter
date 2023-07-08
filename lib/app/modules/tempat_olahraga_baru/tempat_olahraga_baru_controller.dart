import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_olahraga/tempat_olahraga_controller.dart';

class TempatOlahragaBaruController extends GetxController {
  //TODO: Implement TempatOlahragaBaruController.

  late TextEditingController hargaC;

  var id = ''.obs;
  var olahraga_id = ''.obs;
  var harga = ''.obs;

  @override
  void onInit() {
    super.onInit();
    hargaC = new TextEditingController();
    id.value = Get.parameters['id'].toString();

    getOlahraga();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    hargaC.dispose();
  }

  var loadingTempat = false.obs;

  var olahragas = [].obs;
  void getOlahraga() async {
    Session.getToken().then((token) async {
      final response = await Api.client.get(
        Uri.parse(Api.url + 'mitra/tempat/olahraga/get/${id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        olahragas.value = res['data'];
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
      } else {
        var res = jsonDecode(response.body);
      }
    });
  }

  void simpanOlahraga() async {
    loadingTempat.value = true;
    if (olahraga_id.isNotEmpty) {
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/tempat/olahraga/create'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'tempat_id': id.toString(),
              'olahraga_id': olahraga_id.toString(),
              'harga': harga.toString(),
            },
          );
          print(response.body);
          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);

            Get.find<TempatOlahragaController>().getTempat();
            getOlahraga();

            Get.find<TempatDetailController>().getTempat();
            olahraga_id.value = '';
            hargaC.text = '';

            Get.back();
          } else if (response.statusCode == 401) {
            Session.removeAllSession();
            Get.offAllNamed('daftar-masuk');
          } else if (response.statusCode == 422) {
            var res = jsonDecode(response.body);
            Get.snackbar('Gagal', '${res['msg']}');
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
    } else {
      Get.snackbar('Gagal', 'Pilih olahraga');
      loadingTempat(false);
    }
  }
}
