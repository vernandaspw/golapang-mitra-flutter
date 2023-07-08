import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/dompet_riwayat/dompet_riwayat_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DompetDetailController extends GetxController {
  //TODO: Implement DompetDetailController.

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
          Uri.parse(Api.url + 'mitra/saldo/riwayat'),
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

  File? image;

  Future<void> getImage(ImageSource media) async {
    final pickedFile = await ImagePicker().pickImage(source: media);
    if (pickedFile != null) {
      loadingData(true);
      image = File(pickedFile.path);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          final request = http.MultipartRequest(
              'POST', Uri.parse(Api.url + 'mitra/saldo/topup/proses'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img', pickedFile.path),
          );
          // request.fields['img'] = pickedFile.name;
          request.fields['id'] = id.toString();
          final response = await request.send();

          // print(response.statusCode);
          if (response.statusCode == 200) {
            getData();
            // update();
            Get.put<DompetRiwayatController>(DompetRiwayatController())
                .getRiwayat(null);
            // Get.back();
            Get.defaultDialog(
                title: 'Berhasil',
                middleText: 'Berhasil upload bukti pembayaran');
            loadingData(false);
          } else {
            Get.defaultDialog(
                title: 'Gagal', middleText: 'Terjadi kesalahan upload image');
            loadingData(false);
          }
          update();
        } else {
          Get.defaultDialog(
              title: 'Gagal',
              middleText: 'Terjadi kesalahan upload image token');
          loadingData(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }
}
