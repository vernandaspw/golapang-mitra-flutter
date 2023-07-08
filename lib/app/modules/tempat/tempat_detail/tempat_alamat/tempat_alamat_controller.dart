import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';

class TempatAlamatController extends GetxController {
  //TODO: Implement TempatAlamatController.

  late TextEditingController kecamatanC;
  late TextEditingController alamatC;

  var id = ''.obs;
  var provinsi_id = ''.obs;
  var provinsiNama = ''.obs;
  var kota_id = ''.obs;
  var kotaNama = ''.obs;
  var kecamatan = ''.obs;
  var alamat = ''.obs;

  @override
  void onInit() {
    super.onInit();
    kecamatanC = new TextEditingController();
    alamatC = new TextEditingController();
    id.value = Get.parameters['id'].toString();
    getTempat();
    getProvinsi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    kecamatanC.dispose();
    alamatC.dispose();
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
          provinsi_id.value = res['data']['provinsi_id'].toString();
          provinsiNama.value = res['data']['provinsi']['nama'].toString();
          kota_id.value = res['data']['kota_id'].toString();
          kotaNama.value = res['data']['kota']['nama'].toString();

          if (res['data']['kecamatan'] != null) {
            kecamatanC.text = res['data']['kecamatan'];
          }
          if (res['data']['alamat'] != null) {
            alamatC.text = res['data']['alamat'];
          }
          getKota(provinsi_id);
          update();
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

  var provinsis = [].obs;
  void getProvinsi() async {
    final response = await Api.client.get(
      Uri.parse(Api.url + 'provinsi'),
    );

    if (response.statusCode == 200) {
      // jika berhasi save session
      var res = jsonDecode(response.body);
      provinsis.value = res['data'];
    } else if (response.statusCode == 401) {
      var res = jsonDecode(response.body);
    } else {
      var res = jsonDecode(response.body);
    }
  }

  var kotas = [].obs;
  void getKota(provinsiID) async {
    final response = await Api.client.post(
      Uri.parse(Api.url + 'kota'),
      body: {
        'provinsi_id': provinsiID.toString(),
      },
    );

    if (response.statusCode == 200) {
      // jika berhasi save session
      var res = jsonDecode(response.body);
      kotas.value = res['data'];
    } else if (response.statusCode == 401) {
      var res = jsonDecode(response.body);
    } else {
      var res = jsonDecode(response.body);
    }
  }

  void simpan() async {
    loadingTempat.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        print({
          'id': id.toString(),
          'provinsi_id': provinsi_id.toString(),
          'kota_id': kota_id.toString(),
          'kecamatan': kecamatan.toString(),
          'alamat': alamat.toString(),
        });
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/update/alamat'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': id.toString(),
            'provinsi_id': provinsi_id.toString(),
            'kota_id': kota_id.toString(),
            'kecamatan': kecamatan.toString(),
            'alamat': alamat.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);

          Get.find<TempatDetailController>().getTempat();
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
