import 'dart:convert';

import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/services/auth_services.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController.

  @override
  void onInit() {
    super.onInit();
    cekAuth();
    getSession();
    getMe();
  }

  @override
  void onReady() {
    super.onReady();
    refreshToken();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  var namaMitra = ''.obs;
  var role = ''.obs;

  void getSession() async {
    Session.getNama().then((value) {
      namaMitra.value = value.toString();
    });

    Session.getRole().then((value) {
      role.value = value.toString();
    });
  }

  void cekAuth() async {
    AuthServices.me().then((value) async {
      if (value != true) {
        Get.offAllNamed('/daftar-masuk');
        // return const RouteSettings(name: DaftarMasukRoutes.daftarMasuk);
      }
    });
  }

  void refreshToken() async {
    AuthServices.refresh().then((value) {
      if (value == true) {
        print('success refresh token');
      } else {
        print('error refresh token');
        // tampilkan alert dan tombol ubah ip
      }
    });
  }

  var me = {}.obs;
  void getMe() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/auth/me'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          me.value = res['data'];
          // print();
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {
          return null;
        }
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }
}
