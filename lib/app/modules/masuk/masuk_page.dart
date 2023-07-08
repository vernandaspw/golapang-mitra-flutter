import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'masuk_controller.dart';

class MasukPage extends GetView<MasukController> {
  const MasukPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('DaftarMasukPage'),
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      // ),
      backgroundColor: Colors.green,
      body: Obx(
        () => SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/logo/gl-cover-bg-none.png',
                          width: 250,
                          // height: 300,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Login untuk masuk ke akun',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Tema.color600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.email_or_phoneC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.email_or_phone.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Email / Nomor WA',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      controller.showPassword == false
                          ? SizedBox()
                          : Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                controller: controller.passC,
                                obscureText: controller.hidden.isFalse,
                                onChanged: (value) {
                                  controller.password.value = value;
                                },
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                  ),
                                  errorText: controller.validatePassword,
                                  suffixIcon: IconButton(
                                    onPressed: () => controller.hidden.toggle(),
                                    icon: controller.hidden.isTrue
                                        ? const Icon(Icons.remove_red_eye)
                                        : const Icon(
                                            Icons.remove_red_eye_outlined),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.black,
                                  ),
                                  fillColor: Tema.color400,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Password',
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: controller.loadingLogin == true
                            ? ElevatedButton(
                                onPressed: () {},
                                child: CircularProgressIndicator(
                                  color: Tema.color600,
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.maxFinite, 0),
                                  primary: Tema.color400,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  textStyle: TextStyle(fontSize: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  controller.login();
                                },
                                child: Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.maxFinite, 0),
                                  primary: Tema.color600,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  textStyle: TextStyle(fontSize: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/lupa-password');
                          },
                          child: Text(
                            'Lupa password?',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak memiliki akun? ',
                        style: TextStyle(
                          color: Tema.color800,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed('/daftar');
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                              color: Tema.color500,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
