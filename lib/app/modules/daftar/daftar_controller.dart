import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';

class DaftarController extends GetxController {
  //TODO: Implement MasukController.
  var isLoading = false.obs;
  var hidden = false.obs;

  var nama_pengguna = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var nama_mitra = ''.obs;
  var nama_tempat = ''.obs;
  var deskripsi_tempat = ''.obs;
  var provinsi_id = ''.obs;
  var kota_id = ''.obs;
  var kecamatan = ''.obs;
  var alamat = ''.obs;

  late TextEditingController namaPenggunaC;
  late TextEditingController phoneC;
  late TextEditingController emailC;
  late TextEditingController passC;
  late TextEditingController namaMitraC;
  late TextEditingController namaTempatC;
  late TextEditingController deskripsiTempatC;
  late TextEditingController kecamatanC;
  late TextEditingController alamatC;

  var validatePhone, validatePassword, validateUrl;

  @override
  void onInit() {
    super.onInit();
    namaPenggunaC = new TextEditingController();
    phoneC = new TextEditingController();
    emailC = new TextEditingController();
    passC = new TextEditingController();
    namaMitraC = new TextEditingController();
    namaTempatC = new TextEditingController();
    deskripsiTempatC = new TextEditingController();
    kecamatanC = new TextEditingController();
    alamatC = new TextEditingController();
    getProvinsi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    namaPenggunaC.dispose();
    phoneC.dispose();
    emailC.dispose();
    passC.dispose();
    namaMitraC.dispose();
    namaTempatC.dispose();
    deskripsiTempatC.dispose();
    kecamatanC.dispose();
    alamatC.dispose();
  }

  var provinsis = [].obs;
  void getProvinsi() async {
    final response = await Api.client.get(
      Uri.parse(Api.url + 'provinsi'),
    );

    if (response.statusCode == 200) {
      // jika berhasi save session
      var res = jsonDecode(response.body);
      provinsis.value = res['data'];
    } else if (response.statusCode == 401) {
      var res = jsonDecode(response.body);
    } else {
      var res = jsonDecode(response.body);
    }
  }

  var kotas = [].obs;
  void getKota(provinsiID) async {
    final response = await Api.client.post(
      Uri.parse(Api.url + 'kota'),
      body: {
        'provinsi_id': provinsiID.toString(),
      },
    );

    if (response.statusCode == 200) {
      // jika berhasi save session
      var res = jsonDecode(response.body);
      kotas.value = res['data'];
    } else if (response.statusCode == 401) {
      var res = jsonDecode(response.body);
    } else {
      var res = jsonDecode(response.body);
    }
  }

  void daftar() async {
    if (nama_pengguna.isEmpty) {
      Get.defaultDialog(
        middleText: 'Nama pengguna Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (phone.isEmpty) {
      Get.defaultDialog(
        middleText: 'Phone Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (email.isEmpty) {
      Get.defaultDialog(
        middleText: 'Email Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (password.isEmpty) {
      Get.defaultDialog(
        middleText: 'Password Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (nama_mitra.isEmpty) {
      Get.defaultDialog(
        middleText: 'Nama mitra Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (nama_tempat.isEmpty) {
      Get.defaultDialog(
        middleText: 'Nama tempat Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (deskripsi_tempat.isEmpty) {
      Get.defaultDialog(
        middleText: 'Deskripsi tempat Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (provinsi_id.isEmpty) {
      Get.defaultDialog(
        middleText: 'Provinsi Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (kota_id.isEmpty) {
      Get.defaultDialog(
        middleText: 'kota Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (kecamatan.isEmpty) {
      Get.defaultDialog(
        middleText: 'Kecamatan Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (alamat.isEmpty) {
      Get.defaultDialog(
        middleText: 'Alamat Wajib diisi!',
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
    } else {
      final response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/daftar'),
        body: {
          'nama_pengguna': nama_pengguna.toString(),
          'phone': phone.toString(),
          'email': email.toString(),
          'password': password.toString(),
          'nama_mitra': nama_mitra.toString(),
          'nama_tempat': nama_tempat.toString(),
          'deskripsi_tempat': deskripsi_tempat.toString(),
          'provinsi_id': provinsi_id.toString(),
          'kota_id': kota_id.toString(),
          'kecamatan': kecamatan.toString(),
          'alamat': alamat.toString(),
        },
      );

      if (response.statusCode == 200) {
        // jika berhasi save session
        var res = jsonDecode(response.body);

        // mulai simpan session
        Session.saveToken(res['data']['access_token']);
        Session.saveUserId(res['data']['userId']);
        Session.saveUserUuid(res['data']['userUuid'].toString());
        Session.saveUserMitraId(res['data']['userMitraId']);
        Session.saveRole(res['data']['userRole']);
        Session.saveNama(res['data']['userNama']);

        Get.offAllNamed('/home');
      } else if (response.statusCode == 405) {
        var res = jsonDecode(response.body);
        Get.defaultDialog(
          middleText: '${res['msg']}',
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        );
      } else {
        var res = jsonDecode(response.body);
        print(res);
      }
    }
  }
}
