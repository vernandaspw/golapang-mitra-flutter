import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MitraController extends GetxController {
  //TODO: Implement MitraController.

  @override
  void onInit() {
    super.onInit();
    getMe();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var me = {}.obs;
  var loadingMe = false.obs;
  void getMe() async {
    loadingMe.value = true;
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
        } else if (response.statusCode == 401) {
          Session.removeAllSession();
          Get.offAllNamed('/daftar-masuk');
        } else {
          return null;
        }
        loadingMe(false);
      } else {
        Session.removeAllSession();
        Get.offAllNamed('/daftar-masuk');
      }
    });
  }

  // void requestCameraPermission() async {
  //   var status = await Permission.camera.status;
  //   if (status.isDenied) {
  //     // We didn't ask for permission yet or the permission has been denied before but not permanently.
  //     throw PlatformException(
  //       code: 'camera_access_denied',
  //       message: 'The user denied camera access',
  //     );
  //   }
  //   if (await Permission.speech.isPermanentlyDenied) {
  //     // The user opted to never again see the permission request dialog for this
  //     // app. The only way to change the permission's status now is to let the
  //     // user manually enable it in the system settings.
  //     openAppSettings();
  //   }
  // }

  // Rx<File?> image = Rx<File?>(null);
  void pilihMedia(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Please choose media to select'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  //if user click this button, user can upload image from gallery
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  //if user click this button. user can upload image from camera
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
              'POST', Uri.parse(Api.url + 'mitra/mitra/update'));
          request.headers['Authorization'] = 'Bearer $token';
          request.files.add(
            await http.MultipartFile.fromPath('img', pickedFile.path),
          );
          // request.fields['img'] = pickedFile.name;
          final response = await request.send();
          print(response.statusCode);
          if (response.statusCode == 200) {
            getMe();
            update();
          } else {
            loadingMe(false);
            throw Exception('Terjadi kesalahan upload image');
          }
          update();
        } else {
          loadingMe(false);
          throw Exception('Terjadi kesalahan token');
        }
      });
    }
  }
}
