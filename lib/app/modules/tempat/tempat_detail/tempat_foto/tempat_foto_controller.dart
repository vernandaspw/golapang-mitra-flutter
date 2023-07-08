import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/modules/tempat/tempat_detail/tempat_detail_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class TempatFotoController extends GetxController {
  //TODO: Implement TempatFotoController.

  @override
  void onInit() {
    super.onInit();
    id.value = Get.parameters['id'].toString();
    getTempat();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var id = ''.obs;
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

  File? image1;
  Future<void> getImage1(ImageSource media) async {
    final pickedFile = await ImagePicker().pickImage(source: media);
    if (pickedFile != null) {
      image1 = File(pickedFile.path);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          final request = http.MultipartRequest(
              'POST', Uri.parse(Api.url + 'mitra/tempat/update/foto'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img1', pickedFile.path),
          );
          request.fields['id'] = id.toString();
          request.fields['img1'] = pickedFile.name;
          final response = await request.send();

          if (response.statusCode == 200) {
            getTempat();
            Get.find<TempatDetailController>().getTempat();
            update();
            loadingTempat(false);
          } else {
            getTempat();
            update();
            loadingTempat(false);
            throw Exception('Terjadi kesalahan upload image');
          }
          update();
        } else {
          loadingTempat(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }

  File? image2;
  Future<void> getImage2(ImageSource media) async {
    final pickedFile = await ImagePicker().pickImage(source: media);
    if (pickedFile != null) {
      image2 = File(pickedFile.path);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          final request = http.MultipartRequest(
              'POST', Uri.parse(Api.url + 'mitra/tempat/update/foto'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img2', pickedFile.path),
          );
          request.fields['id'] = id.toString();
          request.fields['img2'] = pickedFile.name;
          final response = await request.send();

          if (response.statusCode == 200) {
            getTempat();
            Get.find<TempatDetailController>().getTempat();
            update();
            loadingTempat(false);
          } else {
            getTempat();
            update();
            loadingTempat(false);
            throw Exception('Terjadi kesalahan upload image');
          }
          update();
        } else {
          loadingTempat(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }

  File? image3;
  Future<void> getImage3(ImageSource media) async {
    final pickedFile = await ImagePicker().pickImage(source: media);
    if (pickedFile != null) {
      image3 = File(pickedFile.path);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          final request = http.MultipartRequest(
              'POST', Uri.parse(Api.url + 'mitra/tempat/update/foto'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img3', pickedFile.path),
          );
          request.fields['id'] = id.toString();
          request.fields['img3'] = pickedFile.name;
          final response = await request.send();

          if (response.statusCode == 200) {
            getTempat();
            Get.find<TempatDetailController>().getTempat();
            update();
            loadingTempat(false);
          } else {
            getTempat();
            update();
            loadingTempat(false);
            throw Exception('Terjadi kesalahan upload image');
          }
          update();
        } else {
          loadingTempat(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }

  File? image4;
  Future<void> getImage4(ImageSource media) async {
    final pickedFile = await ImagePicker().pickImage(source: media);
    if (pickedFile != null) {
      image4 = File(pickedFile.path);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          final request = http.MultipartRequest(
              'POST', Uri.parse(Api.url + 'mitra/tempat/update/foto'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img4', pickedFile.path),
          );
          request.fields['id'] = id.toString();
          request.fields['img4'] = pickedFile.name;
          final response = await request.send();

          if (response.statusCode == 200) {
            getTempat();
            Get.find<TempatDetailController>().getTempat();
            update();
            loadingTempat(false);
          } else {
            getTempat();
            update();
            loadingTempat(false);
            throw Exception('Terjadi kesalahan upload image');
          }
          update();
        } else {
          loadingTempat(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }

  File? image5;
  Future<void> getImage5(ImageSource media) async {
    final pickedFile = await ImagePicker().pickImage(source: media);
    if (pickedFile != null) {
      image5 = File(pickedFile.path);
      Session.getToken().then((value) async {
        var token = value;
        if (token != null) {
          final request = http.MultipartRequest(
              'POST', Uri.parse(Api.url + 'mitra/tempat/update/foto'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img5', pickedFile.path),
          );
          request.fields['id'] = id.toString();
          request.fields['img5'] = pickedFile.name;
          final response = await request.send();

          if (response.statusCode == 200) {
            getTempat();
            Get.find<TempatDetailController>().getTempat();
            update();
            loadingTempat(false);
          } else {
            getTempat();
            update();
            loadingTempat(false);
            throw Exception('Terjadi kesalahan upload image');
          }
          update();
        } else {
          loadingTempat(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }

  void hapusImg(img) async {
    Session.getToken().then((value) async {
      var token = value;
      if (token != null) {
        var response = await Api.client.post(
          Uri.parse(Api.url + 'mitra/tempat/hapus/foto'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': id.toString(),
            'img${img}': 'hapus'.toString(),
          },
        );
        // print(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          getTempat();
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
}
