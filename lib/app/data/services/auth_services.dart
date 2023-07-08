import 'dart:convert';

import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends GetxService {
  //TODO: Implement AuthServices GetxService.

  static Future me() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token != null) {
      var response = await Api.client.post(
        Uri.parse(Api.url + 'mitra/auth/me'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      // print(jsonDecode(response.body));
      if (response.statusCode == 401) {
        print('kesalahan token');
        Session.removeAllSession();

        return false;
      } else if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        // print(res);
        Session.saveRole(res['data']['role']);
        Session.saveNama(res['data']['nama']);

        // REFRESH TOKEN DISINI

        // jika berhasil perbarui session token, nama, role

        return true;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static Future refresh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    var response = await Api.client.post(
      Uri.parse(Api.url + 'mitra/auth/refresh'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);

      Session.saveToken(res['data']['access_token']);
      Session.saveUserId(res['data']['userId']);
      Session.saveUserUuid(res['data']['userUuid'].toString());
      Session.saveUserMitraId(res['data']['userMitraId']);
      Session.saveRole(res['data']['userRole']);
      Session.saveNama(res['data']['userNama']);
      return true;
    } else {
      return false;
    }
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await Api.client.post(
      Uri.parse(Api.url + 'mitra/auth/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      return true;
    } else {
      return false;
    }
  }
}
