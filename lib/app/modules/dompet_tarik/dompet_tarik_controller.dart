import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/home/home_controller.dart';

class DompetTarikController extends GetxController {
  //TODO: Implement DompetTarikController.

  late TextEditingController nominalC;
  late TextEditingController anC;
  late TextEditingController norekC;
  late TextEditingController otpC;

  var saldo = 0.obs;

  @override
  void onInit() {
    super.onInit();
    nominalC = new TextEditingController();
    anC = new TextEditingController();
    norekC = new TextEditingController();
    otpC = new TextEditingController();
    saldo.value =
        double.parse(Get.find<HomeController>().me['mitra']['saldo']).toInt();
    getSetting();
    getBank();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nominalC.dispose();
    anC.dispose();
    norekC.dispose();
    otpC.dispose();
  }

  var minimal_tarik = 20000.obs;
  var max_tarik = 1000000.obs;

  var settings = {}.obs;
  void getSetting() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.get(
          Uri.parse(Api.url + 'setting'),
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          settings.value = res['data'];
          minimal_tarik.value =
              double.parse(settings['min_tarik_mitra']).toInt();
          max_tarik.value = double.parse(settings['max_tarik_mitra']).toInt();
        } else {
          print('kesalahan');
        }
      } else {
        print('kesalahan');
      }
    });
  }

  var loadingData = false.obs;

  var bank_id = ''.obs;
  var bank_nama = ''.obs;
  var banks = [].obs;
  void getBank() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.get(
          Uri.parse(Api.url + 'bank'),
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          banks.value = res['data'];
        } else {
          print('kesalahan');
        }
      } else {
        print('kesalahan');
      }
    });
  }

  var otp = ''.obs;

  var loadingEmail = false.obs;
  void sendOtpEmail() async {
    loadingEmail(true);
    Session.getToken().then((value) async {
      loadingEmail(true);
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/saldo/tarik-otp-email'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          Get.defaultDialog(title: 'Berhasil', middleText: '${res['msg']}');
          loadingEmail(false);
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else if (response.statusCode == 422) {
          var res = jsonDecode(response.body);
          Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
          loadingEmail(false);
        } else {
          var res = jsonDecode(response.body);
          Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
          loadingEmail(false);
        }
        loadingEmail(false);
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
    loadingEmail(false);
  }

  var loadingWa = false.obs;
  void sendOtpWa() async {
    loadingWa(true);
    Session.getToken().then((value) async {
      loadingWa(true);
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/saldo/tarik-otp-wa'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          Get.defaultDialog(title: 'Berhasil', middleText: '${res['msg']}');
          loadingWa(false);
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else if (response.statusCode == 422) {
          var res = jsonDecode(response.body);
          Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
          loadingWa(false);
        } else {
          var res = jsonDecode(response.body);
          Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
          loadingWa(false);
        }
        loadingWa(false);
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
    loadingWa(false);
  }

  var nominal = 0.obs;
  var an = ''.obs;
  var norek = ''.obs;
  var fee = 0.obs;

  var total = 0.obs;

  var loadingTarik = false.obs;
  void tarik() async {
    loadingTarik(true);
    // cek nominal wajib isi
    // cek wajib pilih bank
    // cek an wajib isi
    // cek norek wajib isi
    // otp wajib isi
    // cek total tidak boleh lebih dari saldo
    // cek tarik tidak boleh dibawah min tarik
    // cek tarik tidak boleh melebihi max tarik

    if (nominal.toString().isEmpty || nominal == 0) {
      Get.defaultDialog(title: 'gagal', middleText: 'Nominal wajib di isi');
      loadingTarik(false);
    } else if (bank_nama.toString().isEmpty || bank_id.isEmpty) {
      Get.defaultDialog(title: 'gagal', middleText: 'Wajib Pilih bank');
      loadingTarik(false);
    } else if (an.isEmpty) {
      Get.defaultDialog(title: 'gagal', middleText: 'Atas nama wajib di isi');
      loadingTarik(false);
    } else if (norek.isEmpty) {
      Get.defaultDialog(
          title: 'gagal', middleText: 'Nomor rekening wajib di isi');
      loadingTarik(false);
    } else if (otp.isEmpty) {
      Get.defaultDialog(title: 'gagal', middleText: 'Kode OTP wajib di isi');
      loadingTarik(false);
    } else if (total.toInt() > saldo.toInt()) {
      Get.defaultDialog(title: 'gagal', middleText: 'Saldo anda tidak cukup');
      loadingTarik(false);
    } else if (total.toInt() < minimal_tarik.toInt()) {
      Get.defaultDialog(
          title: 'gagal',
          middleText:
              'Minimal penarikan ${FormatUang.keIdr(minimal_tarik.toInt(), 0)}');
      loadingTarik(false);
    } else if (total.toInt() > max_tarik.toInt()) {
      Get.defaultDialog(
          title: 'gagal',
          middleText:
              'Maksimal penarikan ${FormatUang.keIdr(max_tarik.toInt(), 0)}');
      loadingTarik(false);
    } else {
      Session.getToken().then((value) async {
        loadingTarik(true);
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/saldo/tarik'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'nominal': nominal.toString(),
              'bank_id': bank_id.toString(),
              'an': an.toString(),
              'norek': norek.toString(),
              'otp': otp.toString(),
              'fee': fee.toString(),
              'total': total.toString(),
            },
          );
          print(response.body);
          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);

            Get.find<HomeController>().getMe();

            // Get.offNamed('/dompet-riwayat');
            // Get.toNamed('/dompet-detail/${res['data']['id']}');

            Get.offNamed('/dompet-detail/${res['data']['id']}');

            // Get.offNamed('/dompet-riwayat');
            loadingTarik(false);
          } else if (response.statusCode == 401) {
            Session.removeAllSession();
            Get.offAllNamed('/daftar-masuk');
          } else if (response.statusCode == 422) {
            var res = jsonDecode(response.body);
            Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
            loadingTarik(false);
          } else {
            loadingTarik(false);
          }
          loadingTarik(false);
        } else {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        }
      });
      loadingTarik(false);
    }
  }
}
