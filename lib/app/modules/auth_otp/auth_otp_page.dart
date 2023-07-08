import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'auth_otp_controller.dart';

class AuthOtpPage extends GetView<AuthOtpController> {
  const AuthOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          width: 100,
                          // height: 300,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text(
                            'Verifikasi kode OTP',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Tema.color600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      controller.msg == null
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Center(
                                child: Text(
                                  '${controller.msg}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                    // fontWeight: FontWeight.bold,
                                    color: Tema.color700,
                                  ),
                                ),
                              ),
                            ),
                      controller.msg == null
                          ? Container()
                          : SizedBox(
                              height: 3,
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text(
                            'Kode OTP expired dalam ${controller.code_expired_menit} menit setelah ${controller.code_expired_at}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Tema.color700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.otpC,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            controller.otp.value = value;
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
                            errorText: controller.validateOtp,
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
                            hintText: 'KODE OTP',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
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
                                  controller.loginOtp();
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
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text(
                            'Minta OTP baru dalam ${controller.code_resend_menit} menit setelah ${controller.code_resend_at}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Tema.color700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: controller.loadingResend == true
                            ? CircularProgressIndicator(
                                color: Tema.color600,
                              )
                            : InkWell(
                                onTap: () {
                                  controller.resendOtpEmail();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  child: Text(
                                    'Kirim ulang OTP Baru ke Email',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Tema.color600,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Center(
                        child: controller.loadingResend == true
                            ? CircularProgressIndicator(
                                color: Tema.color600,
                              )
                            : InkWell(
                                onTap: () {
                                  controller.resendOtpWa();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  child: Text(
                                    'Kirim ulang OTP Baru ke nomor WA',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Tema.color600,
                                    ),
                                  ),
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
                          Get.toNamed('/daftar');
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
