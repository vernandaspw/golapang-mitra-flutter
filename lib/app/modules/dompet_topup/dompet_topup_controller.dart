import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/dompet_riwayat/dompet_riwayat_controller.dart';
import 'package:golapang_mitra/app/modules/home/home_controller.dart';

class DompetTopupController extends GetxController {
  //TODO: Implement DompetTopupController.

  late TextEditingController nominalC;

  @override
  void onInit() {
    super.onInit();
    nominalC = new TextEditingController();
    getSetting();
    getKodeUnik();
    getMetodePembayaran();
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

  var minimal_topup = 20000.obs;
  var max_topup = 1000000.obs;

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
          minimal_topup.value = double.parse(settings['min_isi_mitra']).toInt();
          max_topup.value = double.parse(settings['max_isi_mitra']).toInt();

          fee.value = double.parse(settings['fee_mitra_topup']).toInt();
          max.value = double.parse(settings['kode_unik_max']).toInt();
          min.value = double.parse(settings['kode_unik_min']).toInt();
          getKodeUnik();
        } else {
          print('kesalahan');
        }
      } else {
        print('kesalahan');
      }
    });
  }

  var kode_unik = 123.obs;
  var max = 1000.obs;
  var min = 100.obs;
  void getKodeUnik() async {
    kode_unik.value = Random().nextInt(max.toInt() - min.toInt()) + min.toInt();
  }

  var loadingData = false.obs;

  var metode_pembayarans = [].obs;
  void getMetodePembayaran() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.get(
          Uri.parse(Api.url + 'metode-pembayaran'),
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          metode_pembayarans.value = res['data'];
        } else {
          print('kesalahan');
        }
      } else {
        print('kesalahan');
      }
    });
  }

  var bank_perusahaan_id = ''.obs;
  var bank_perusahaans = [].obs;
  void getBankPerusahaan(params) async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.get(
          Uri.parse(Api.url + 'bank-perusahaan?metodepembayaranid=${params}'),
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          bank_perusahaans.value = res['data'];
        } else {
          print('kesalahan');
        }
      } else {
        print('kesalahan');
      }
    });
  }

  var metode_pembayaran_nama = ''.obs;

  var nominal = 0.obs;
  var metode_pembayaran_id = ''.obs;
  var fee = 0.obs;
  var fee_vendor = 0.obs;

  var total_pembayaran = 0.obs;

  var loadingBayar = false.obs;
  void bayar() async {
    loadingBayar(true);
    if (nominal < minimal_topup.toInt()) {
      Get.defaultDialog(
        title: 'Gagal',
        middleText:
            'minimal topup ${FormatUang.keIdr(minimal_topup.toInt(), 0)}',
        textCancel: 'Oke',
      );
      loadingBayar(false);
    } else if (nominal > max_topup.toInt()) {
      Get.defaultDialog(
        title: 'Gagal',
        middleText: 'maksimal topup ${FormatUang.keIdr(max_topup.toInt(), 0)}',
        textCancel: 'Oke',
      );
      loadingBayar(false);
    } else {
      if (nominal.toString().isEmpty || nominal == 0) {
        Get.defaultDialog(title: 'gagal', middleText: 'Nominal wajib di isi');
        loadingBayar(false);
      } else if (metode_pembayaran_id.isEmpty) {
        Get.defaultDialog(
            title: 'gagal', middleText: 'Wajib Pilih metode pembayaran!');
        loadingBayar(false);
      } else if (metode_pembayaran_nama.toString() == 'manual' &&
          bank_perusahaan_id.isEmpty) {
        Get.defaultDialog(title: 'gagal', middleText: 'Wajib Pilih bank');
        loadingBayar(false);
      } else {
        Session.getToken().then((value) async {
          var token = value;
          if (token != null) {
            var response = await Api.client.post(
              Uri.parse(Api.url + 'mitra/saldo/topup'),
              headers: {
                'Authorization': 'Bearer $token',
              },
              body: {
                'nominal': nominal.toString(),
                'metode_pembayaran_id': metode_pembayaran_id.toString(),
                'bank_perusahaan_id': bank_perusahaan_id.toString(),
                'kode_unik': kode_unik.toString(),
                'fee': fee.toString(),
                'fee_vendor': fee_vendor.toString(),
                'total_pembayaran': total_pembayaran.toString(),
              },
            );
            // print(response.body);
            if (response.statusCode == 200) {
              var res = jsonDecode(response.body);

              Get.find<HomeController>().getMe();

              // Get.offNamed('/dompet-riwayat');
              // Get.toNamed('/dompet-detail/${res['data']['id']}');

              Get.offNamed('/dompet-detail/${res['data']['id']}');

              // Get.offNamed('/dompet-riwayat');
              loadingBayar(false);
            } else if (response.statusCode == 401) {
              Session.removeAllSession();
              Get.offAllNamed('/daftar-masuk');
            } else if (response.statusCode == 422) {
              var res = jsonDecode(response.body);
              Get.defaultDialog(title: 'gagal', middleText: '${res['msg']}');
              loadingBayar(false);
            } else {
              loadingBayar(false);
            }
            loadingBayar(false);
          } else {
            Session.removeAllSession();
            Get.offAllNamed('/daftar-masuk');
          }
        });
      }
    }
  }
}
