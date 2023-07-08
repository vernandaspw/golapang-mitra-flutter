import 'dart:convert';

import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';

class TempatFasilitasController extends GetxController {
  //TODO: Implement TempatFasilitasController.

  var id = ''.obs;
  var fasilitas_id = ''.obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.parameters['id'].toString();
    getTempat();
    getFasilitas();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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

          update();
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

  var fasilitas = [].obs;
  void getFasilitas() async {
    Session.getToken().then((token) async {
      final response = await Api.client.get(
        Uri.parse(Api.url + 'mitra/tempat/fasilitas/get/${id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);
        fasilitas.value = res['data'];
      } else if (response.statusCode == 401) {
        var res = jsonDecode(response.body);
      } else {
        var res = jsonDecode(response.body);
      }
    });
  }

  void simpanFasilitas() async {
    loadingTempat.value = true;
    if (fasilitas_id.isNotEmpty) {
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          var response = await Api.client.post(
            Uri.parse(Api.url + 'mitra/tempat/fasilitas/create'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'tempat_id': id.toString(),
              'fasilitas_id': fasilitas_id.toString(),
            },
          );
          // print(response.body);
          if (response.statusCode == 200) {
            var res = jsonDecode(response.body);
            fasilitas_id.value = '';
            getTempat();
            getFasilitas();
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
    } else {
      Get.snackbar('Gagal', 'Pilih fasilitas');
      loadingTempat(false);
    }
  }

  void hapusFasilitas(params) {
    loadingTempat.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/fasilitas/delete'),
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
          getFasilitas();
          Get.find<TempatDetailController>().getTempat();
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
}
