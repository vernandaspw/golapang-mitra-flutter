import 'dart:convert';
// import 'dart:ffi';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Session {
  // TOKEN ==========================================================
  static Future<String?> saveToken(token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
    final String? data = pref.getString('token');
    return data;
  }

  static Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? data = pref.getString('token');
    return data;
  }
// =====================================================================

// ID USER ==============================================================
  static Future<int?> saveUserId(userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('userId', userId);
    final int? data = pref.getInt('userId');
    return data;
  }

  static Future<int?> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? data = pref.getInt('userId');
    return data;
  }

// ===================================================================
// mitra id ==============================================================
  static Future<int?> saveUserMitraId(userMitraId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('userMitraId', userMitraId);
    final int? data = pref.getInt('userMitraId');
    return data;
  }

  static Future<int?> getUserMitraId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? data = pref.getInt('userMitraId');
    return data;
  }
// ===================================================================

// NAMA ==============================================================
  static Future<String?> saveUserUuid(userUuid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('userUuid', userUuid);
    final String? data = pref.getString('userUuid');
    return data;
  }

  static Future<String?> getUserUuid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? data = pref.getString('userUuid');
    return data;
  }

// ===================================================================
// NAMA ==============================================================
  static Future<String?> saveNama(userNama) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('userNama', userNama);
    final String? data = pref.getString('userNama');
    return data;
  }

  static Future<String?> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? data = pref.getString('userNama');
    return data;
  }
// ===================================================================

// ROLE ==============================================================
  static Future<String?> saveRole(userRole) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('userRole', userRole);
    final String? data = pref.getString('userRole');
    return data;
  }

  static Future<String?> getRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? data = pref.getString('userRole');
    return data;
  }

  // ==================================================================

// REMOVE ALL SESSION ===================================================
  static Future<String> removeAllSession() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.remove('userId');
    await pref.remove('userUuid');
    await pref.remove('userMitraId');
    await pref.remove('userRole');
    await pref.remove('userNama');
    var success = 'success';
    return success;
  }

  // ====================================================================
  
}
