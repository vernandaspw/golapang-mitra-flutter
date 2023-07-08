import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/lapangan_detail/lapangan_detail_controller.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';

class LapanganEditController extends GetxController {
  //TODO: Implement LapanganEditController.

  var id = ''.obs;
  var lapangan_id = ''.obs;
  late TextEditingController namaC;

  @override
  void onInit() {
    super.onInit();
    namaC = new TextEditingController();
    id.value = Get.parameters['id'].toString();
    lapangan_id.value = Get.parameters['lapanganid'].toString();
    getLapangan();

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

  var lapangan = {}.obs;
  var loadingLapangan = false.obs;

  void getLapangan() async {
    loadingLapangan.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/lapangan'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': lapangan_id.toString(),
            'tempat_id': id.toString(),
          },
        );

        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          lapangan.value = res['data'];
          print(res['data']);

          namaC.text = lapangan['nama'].toString();
          tempat_olahraga_id.value = lapangan['tempat_olahraga_id'].toString();
          tipe_lapangan_id.value = lapangan['tipe_lapangan_id'].toString();
          alas_lapangan_id.value = lapangan['alas_lapangan_id'].toString();
          isaktif.value = lapangan['isaktif'] == 1 ? true : false;

          tempat_olahraga_nama.value =
              lapangan['tempat_olahraga']['olahraga']['nama'];
          tipe_lapangan_nama.value = lapangan['tipe_lapangan'] != null
              ? lapangan['tipe_lapangan']['nama']
              : 'Pilih';
          alas_lapangan_nama.value = lapangan['alas_lapangan'] != null
              ? lapangan['alas_lapangan']['nama']
              : 'Pilih';

          loadingLapangan.value = false;
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {
          loadingLapangan.value = false;
          print('error');
        }
        loadingLapangan.value = false;
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

  var tempat_olahraga_nama = ''.obs;
  var tipe_lapangan_nama = ''.obs;
  var alas_lapangan_nama = ''.obs;

  void simpanLapangan() async {
    // print(tipe_lapangan_id);
    loadingLapangan.value = true;
    if (namaC.text.isEmpty) {
      Get.defaultDialog(
          title: 'gagal', middleText: 'Nama lapangan wajib di isi');
      loadingLapangan.value = false;
    } else if (tempat_olahraga_id.isEmpty) {
      Get.defaultDialog(title: 'gagal', middleText: 'Wajib Pilih Olahraga!');
      loadingLapangan.value = false;
    } else {
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/lapangan/update'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'id': lapangan_id.toString(),
              'tempat_id': id.toString(),
              'nama': namaC.text.toString(),
              'tempat_olahraga_id': tempat_olahraga_id.toString(),
              'tipe_lapangan_id': tipe_lapangan_id.toString(),
              'alas_lapangan_id': alas_lapangan_id.toString(),
              'isaktif': isaktif.toString(),
            },
          );
          // print(response.body);
          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);

            Get.find<TempatDetailController>().getTempat();
            Get.find<LapanganDetailController>().getLapangan();
            loadingLapangan.value = false;
            Get.back();
          } else if (response.statusCode == 401) {
            Session.removeAllSession();
            Get.offAllNamed('/daftar-masuk');
          } else {
            loadingLapangan.value = false;
          }
          loadingLapangan.value = false;
        } else {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        }
      });
    }
  }
}
