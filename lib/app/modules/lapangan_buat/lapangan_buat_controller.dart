import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';

class LapanganBuatController extends GetxController {
  //TODO: Implement LapanganBuatController.

  var id = ''.obs;
  late TextEditingController namaC;

  @override
  void onInit() {
    super.onInit();
    namaC = new TextEditingController();
    id.value = Get.parameters['id'].toString();
    getTempat();
    getTempatOlahraga();
    getTipeLapangan();
    getAlasLapangan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    namaC.dispose();
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

  var tempatOlahragas = [].obs;
  void getTempatOlahraga() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client
            .post(Uri.parse(Api.url + 'tempat-olahraga'), body: {
          'tempat_id': id.toString(),
        });
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          tempatOlahragas.value = res['data'];
          // print(res['data']);
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {}
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }

  var tipeLapangans = [].obs;
  void getTipeLapangan() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.get(
          Uri.parse(Api.url + 'tipe-lapangan'),
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          tipeLapangans.value = res['data'];
          // print(res['data']);
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {}
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }

  var alasLapangans = [].obs;
  void getAlasLapangan() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.get(
          Uri.parse(Api.url + 'alas-lapangan'),
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          alasLapangans.value = res['data'];
          // print(res['data']);
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {}
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }

  var nama = ''.obs;
  var tempat_olahraga_id = ''.obs;
  var tipe_lapangan_id = ''.obs;
  var alas_lapangan_id = ''.obs;
  var isaktif = true.obs;

  void simpanLapangan() async {
    loadingTempat.value = true;
    if (namaC.text.isEmpty) {
      Get.defaultDialog(
          title: 'gagal', middleText: 'Nama lapangan wajib di isi');
      loadingTempat.value = false;
    } else if (tempat_olahraga_id.isEmpty) {
      Get.defaultDialog(title: 'gagal', middleText: 'Wajib Pilih Olahraga!');
      loadingTempat.value = false;
    } else {
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/lapangan/create'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'tempat_id': id.toString(),
              'nama': namaC.text.toString(),
              'tempat_olahraga_id': tempat_olahraga_id.toString(),
              'tipe_lapangan_id': tipe_lapangan_id.toString(),
              'alas_lapangan_id': alas_lapangan_id.toString(),
              'isaktif': isaktif.toString(),
            },
          );

          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);
            print(res['data']);
            Get.find<TempatDetailController>().getTempat();
            loadingTempat.value = false;
            Get.back();
          } else if (response.statusCode == 401) {
            Session.removeAllSession();
            Get.offAllNamed('/daftar-masuk');
          } else {
            loadingTempat.value = false;
          }
          loadingTempat.value = false;
        } else {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        }
      });
    }
  }
}
