import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';

class TempatOlahragaController extends GetxController {
  //TODO: Implement TempatOlahragaController.

  late TextEditingController hargaItemC;
  late TextEditingController diskonPersenC;
  var id = ''.obs;
  var olahraga_id = ''.obs;
  var harga = ''.obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.parameters['id'].toString();

    hari.value = '';
    tempat_olahraga_id.value = '';
    hargaRegulerHari.value = [];
    hargaRegulers.value = [];

    getTempat();
  }

  @override
  void onReady() {
    super.onReady();

    hargaItemC = new TextEditingController();
    diskonPersenC = new TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    hargaItemC.dispose();
    diskonPersenC.dispose();
  }

  var tempat = {}.obs;
  var loadingTempat = false.obs;

  getTempat() async {
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
          olahraga_id.value = '';

          // update();
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

  void hapusOlahraga(params) {
    loadingTempat.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/olahraga/delete'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'tempat_id': id.toString(),
            'id': params.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          getTempat();

          hari.value = '';
          tempat_olahraga_id.value = '';
          hargaRegulerHari.value = [];
          hargaRegulers.value = [];

          Get.find<TempatDetailController>().getTempat();
          update();
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

  var tabHarga = 0.obs;

  var tempat_olahraga_id = ''.obs;
  var tempat_olahraga_nama = ''.obs;

  var hargaRegulerHari = [].obs;
  void getHargaRegulerHari(params, namaP) async {
    Session.getToken().then((token) async {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/tempat/harga/get'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'tempat_id': id.toString(),
          'tempat_olahraga_id': params.toString(),
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        hargaRegulerHari.value = res['data'];
        tempat_olahraga_id.value = params.toString();
        tempat_olahraga_nama.value = namaP.toString();
        hari.value = 'senin';
        getHargaReguler(hari.toString());
        // getTempat();
        update();
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
      } else {
        var res = jsonDecode(response.body);
        hargaRegulers.value = [];
      }
    });
  }

  var hari = ''.obs;
  var hargaRegulers = [].obs;
  void getHargaReguler(params) async {
    hari.value = params;
    Session.getToken().then((token) async {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/tempat/harga/get'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'tempat_id': id.toString(),
          'tempat_olahraga_id': tempat_olahraga_id.toString(),
          'hari': params.toString().toLowerCase(),
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        hargaRegulers.value = res['data'];
        // print(hargaRegulers);
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
      } else {
        var res = jsonDecode(response.body);
        hargaRegulers.value = [];
      }
    });
  }

  var editStatusItem = true.obs;

  var loadingEditHargaItem = false.obs;
  void editHargaItem(params) async {
    Session.getToken().then((value) async {
      loadingEditHargaItem(true);
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/harga/update'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'tempat_id': id.toString(),
            'tempat_olahraga_id': tempat_olahraga_id.toString(),
            'hari': hari.toString().toLowerCase(),
            'id': params.toString(),
            'harga': hargaItemC.text,
            'diskon_persen': diskonPersenC.text,
            'isaktif': editStatusItem.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          getTempat();
          getHargaReguler(hari.toString());
          Get.find<TempatDetailController>().getTempat();
          update();
          loadingEditHargaItem(false);
          Get.back();
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('daftar-masuk');
          loadingEditHargaItem(false);
        } else {
          loadingEditHargaItem(false);
          throw Exception('Terjadi kesalahan');
        }
        loadingEditHargaItem(false);
      } else {
        loadingEditHargaItem(false);
        throw Exception('Terjadi kesalahan');
      }
    });
  }

  var loadingToggle = false.obs;
  void editHargaItemToggle(params) async {
    Session.getToken().then((value) async {
      loadingToggle(true);
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/harga/toggle'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'tempat_id': id.toString(),
            'tempat_olahraga_id': tempat_olahraga_id.toString(),
            'hari': hari.toString().toLowerCase(),
            'id': params.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          // getTempat();
          getHargaReguler(hari.toString());
          Get.find<TempatDetailController>().getTempat();
          update();
          loadingToggle(false);
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('daftar-masuk');
          loadingToggle(false);
        } else {
          loadingToggle(false);
          throw Exception('Terjadi kesalahan');
        }
        loadingToggle(false);
      } else {
        loadingToggle(false);
        throw Exception('Terjadi kesalahan');
      }
    });
  }
}
