import 'dart:convert';

import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';

class DompetKreditDetailController extends GetxController {
  //TODO: Implement DompetKreditDetailController.

  var id = ''.obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.parameters['id'].toString();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var data = {}.obs;
  var loadingData = false.obs;
  void getData() async {
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
            'id': id.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          data.value = res['data'];
          // print(data['bank_perusahaan']);
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
