import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class LapanganDetailController extends GetxController {
  //TODO: Implement LapanganDetailController.

  var tempat_id = ''.obs;
  var lapangan_id = ''.obs;

  @override
  void onInit() {
    tempat_id.value = Get.parameters['tempat_id'].toString();
    lapangan_id.value = Get.parameters['lapangan_id'].toString();

    super.onInit();

    getLapangan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // Get.find<TempatDetailController>().getTempat();
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
            'tempat_id': tempat_id.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          lapangan.value = res['data'];
          // print(res['data']);
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

  void updateIsaktifLapangan(params) async {
    // print(params);
    // return null;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/lapangan/toggle'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'tempat_id': tempat_id.toString(),
            'id': params.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);

          getLapangan();
          Get.find<TempatDetailController>().getTempat();
          update();
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

  File? image;
  Future<void> getImage(ImageSource media) async {
    final pickedFile = await ImagePicker().pickImage(source: media);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          final request = http.MultipartRequest(
              'POST', Uri.parse(Api.url + 'mitra/lapangan/update-foto'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img', pickedFile.path),
          );
          request.fields['id'] = lapangan_id.toString();
          request.fields['tempat_id'] = tempat_id.toString();
          request.fields['img'] = pickedFile.name;
          final response = await request.send();

          if (response.statusCode == 200) {
            getLapangan();
            Get.find<TempatDetailController>().getTempat();
            update();
            loadingLapangan(false);
          } else {
            getLapangan();
            update();
            loadingLapangan(false);
            throw Exception('Terjadi kesalahan upload image');
          }
          update();
        } else {
          loadingLapangan(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }

  void hapusImg() async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/lapangan/hapus-foto'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': lapangan_id.toString(),
            'tempat_id': tempat_id.toString(),
            'img': 'hapus'.toString(),
          },
        );
        print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          getLapangan();
          Get.find<TempatDetailController>().getTempat();
          update();
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {
          print('error');
        }
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }

  void hapusLapangan() async {
    // print(tipe_lapangan_id);
    loadingLapangan.value = true;
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/lapangan/hapus'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': lapangan_id.toString(),
            'tempat_id': tempat_id.toString(),
          },
        );
        print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);

          Get.find<TempatDetailController>().getTempat();
          loadingLapangan.value = false;
          Get.back();
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
