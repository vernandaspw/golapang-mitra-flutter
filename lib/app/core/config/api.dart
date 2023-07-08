import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static var client = http.Client();
  static var multipartRequest = http.MultipartRequest;
  static var multipartFile = http.MultipartFile;

  // static const domain = 'https://api.vernandaspw.my.id';
  // static const url = '192.168.8.103/tokoskd/public/api/';
  static const mainUrl = '10.0.2.2:8000';
  // static const mainUrl = '127.0.0.1:8000';
  static const url = 'http://${mainUrl}/api/';
  static const urlImg = 'http://${mainUrl}/storage/';

  // static getUrl() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? data = prefs.getString('url');
  //   var url = 'http://${data}/api/';
  //   return url;
  // }

  // static const url = 'http://10.0.2.2:8000/api/';
}
