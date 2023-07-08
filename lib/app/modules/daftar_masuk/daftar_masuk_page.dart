import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'daftar_masuk_controller.dart';

class DaftarMasukPage extends GetView<DaftarMasukController> {
  const DaftarMasukPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('DaftarMasukPage'),
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      // ),
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/gl-cover-bg-none.png',
                width: 300,
                // height: 300,
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  '#Pasti Ada Tempat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Tema.color600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  'GoLapang, memudahkan kamu dalam mengelola dan memasarkan tempat olahraga',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/masuk');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Tema.color800,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.maxFinite, 0),
                    primary: Tema.color100,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/daftar');
                  },
                  child: Text('Daftar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.maxFinite, 0),
                    primary: Tema.color600,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
