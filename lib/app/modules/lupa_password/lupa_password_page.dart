import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'lupa_password_controller.dart';

class LupaPasswordPage extends GetView<LupaPasswordController> {
  const LupaPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LupaPasswordPage'),
      //   centerTitle: true,
      // ),
      backgroundColor: Tema.color600,
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
                          'Reset password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Tema.color600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Masukan email / wa untuk reset password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Tema.color700),
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
                            // errorText: controller.validatePhone,
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
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: controller.loadingKirim == true
                            ? ElevatedButton(
                                onPressed: () {},
                                child: CircularProgressIndicator(),
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
                                  controller.kirim();
                                },
                                child: Text('Kirim'),
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
                            Get.back();
                          },
                          child: Text(
                            '   Batal   ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
