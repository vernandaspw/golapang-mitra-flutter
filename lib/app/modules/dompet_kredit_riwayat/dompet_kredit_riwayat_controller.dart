import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';

class DompetKreditRiwayatController extends GetxController {
  //TODO: Implement DompetKreditRiwayatController.

  var tabBar = 0.obs;
  var take = 10.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getRiwayat();
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
      getRiwayat();
    }
  }

  var riwayat = [].obs;
  var loadingData = false.obs;
  void getRiwayat() async {
    loadingData(true);
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/saldo-kredit/riwayat'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'take': take.toString(),
          },
        );
        print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          riwayat.value = res['data'];
          take.value++;
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
