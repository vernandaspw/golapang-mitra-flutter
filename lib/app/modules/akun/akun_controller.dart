import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/services/auth_services.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';

class AkunController extends GetxController {
  //TODO: Implement AkunController.

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() async {
    AuthServices.logout().then(
      (value) {
        if (value == true) {
          Session.removeAllSession();
          Get.offAllNamed("/daftar-masuk");
        } else {
          Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: 'Koneksi',
          );
        }
      },
    );
  }
}
