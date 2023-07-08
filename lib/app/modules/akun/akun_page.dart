import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'akun_controller.dart';

class AkunPage extends GetView<AkunController> {
  const AkunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun'),
        centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: Column(
        children: [
          Container(
            color: Tema.color600,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Vernanda',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Pemilik mitra',
                    style: TextStyle(color: Colors.white
                        // fontWeight: FontWeight.bold,
                        // fontSize: 20,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alamat',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.edit,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jl. kesatria',
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Icon(
                      //   Icons.edit,
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.edit,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '082299998741',
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Icon(
                      //   Icons.edit,
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.edit,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'vernanda@gmail.com',
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Icon(
                      //   Icons.edit,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Tema.color400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text('ubah password'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    middleText: "Yakin ingin logout?",
                    textConfirm: 'Logout',
                    onConfirm: () {
                      controller.logout();
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
