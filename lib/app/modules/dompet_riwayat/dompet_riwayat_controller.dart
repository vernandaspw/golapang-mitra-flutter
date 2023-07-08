import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/home/home_controller.dart';

class DompetRiwayatController extends GetxController {
  //TODO: Implement DompetRiwayatController.

  var tabBar = 0.obs;
  var take = 10.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getRiwayat(null);
    scrollController.addListener(_scrollListener);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      var status = '';
      if (tabBar == 0) {
        status = null.toString();
      } else if (tabBar == 1) {
        status = 'pembayaran';
      } else if (tabBar == 2) {
        status = 'proses';
      } else if (tabBar == 3) {
        status = 'berhasil';
      } else if (tabBar == 4) {
        status = 'gagal';
      } else if (tabBar == 5) {
        status = 'batal';
      }
      getRiwayat(status);
    }
  }

  var riwayat = [].obs;
  var loadingData = false.obs;
  void getRiwayat(status) async {
    loadingData(true);
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/saldo/riwayat'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'take': take.toString(),
            'status': status.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          riwayat.value = res['data'];
          take.value++;
          Get.find<HomeController>().getMe();
          loadingData(false);
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {
          loadingData(false);
        }
        loadingData(false);
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }
}
