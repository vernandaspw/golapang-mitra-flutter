import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/services/auth_services.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';

class StartScreenController extends GetxController {
  //TODO: Implement StartScreenController.

  @override
  void onInit() {
    super.onInit();
    cekAuth();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void cekAuth() async {
    await Future.delayed(Duration(milliseconds: 2500));
    Session.getToken().then((value) {
      if (value == null) {
        // ke home
        Get.offAllNamed('/daftar-masuk');
      } else {
        AuthServices.me().then((value) {
          if (value == true) {
            Get.offAllNamed('/home');
          } else {
            Get.offAllNamed('/daftar-masuk');
          }
        });
      }
    });
  }
}
