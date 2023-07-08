import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';

class TempatJamOperasionalController extends GetxController {
  //TODO: Implement TempatJamOperasionalController.

  var id = ''.obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.parameters['id'].toString();
    getTempat();
    timeC = new TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    timeC.dispose();
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

  late TextEditingController timeC;

  TimeOfDay timeOfDay = TimeOfDay.now();
  timeStart(byID, context) async {
    var time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: timeOfDay,
      confirmText: 'SIMPAN',
      // builder: (context, child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      //     child: child ?? Container(),
      //   );
      // },
    );

    if (time != null) {
      // timeC.text = "${time.hour}:${time.minute}";
      loadingTempat(true);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/tempat/jam-operasional/jam-buka'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'id': byID.toString(),
              'tempat_id': id.toString(),
              'jam_buka': '${time.hour}:${time.minute}'
            },
          );
          // print(response.body);
          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);
            getTempat();
            // print(res['data']);
            Get.find<TempatDetailController>().getTempat();
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
        loadingTempat(false);
      });
    }
  }

  timeEnd(byID, context) async {
    var time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: timeOfDay,
      confirmText: 'SIMPAN',
      // builder: (context, child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      //     child: child ?? Container(),
      //   );
      // },
    );

    if (time != null) {
      loadingTempat(true);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/tempat/jam-operasional/jam-tutup'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'id': byID.toString(),
              'tempat_id': id.toString(),
              'jam_tutup': '${time.hour}:${time.minute}'
            },
          );
          // print(response.body);
          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);
            getTempat();
            // print(res['data']);
            Get.find<TempatDetailController>().getTempat();
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
        loadingTempat(false);
      });
    }
  }

  void buka(byID) {
    loadingTempat(true);
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/jam-operasional/buka'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': byID.toString(),
            'tempat_id': id.toString(),
          },
        );
        print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          getTempat();
          // print(res['data']);
          Get.find<TempatDetailController>().getTempat();

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
      loadingTempat(false);
    });
  }
}
