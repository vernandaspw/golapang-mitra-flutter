import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';
import 'package:image_picker/image_picker.dart';

import 'tempat_foto_controller.dart';

class TempatFotoPage extends GetView<TempatFotoController> {
  const TempatFotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat Foto'),
        centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: Obx(
        () => controller.loadingTempat == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.all(10),
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            title: Text('Ganti atau hapus'),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      controller.getImage1(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.image),
                                        Text('From Gallery'),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () async {
                                      controller.hapusImg(1);
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Text('Hapus'),
                                      ],
                                    ),
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () async {
                                  //     Navigator.pop(context);
                                  //     controller.getImage1(ImageSource.camera);
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       Icon(Icons.camera),
                                  //       Text('From Camera'),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CoverItem(
                      controller: controller,
                      nama: 'Cover 1 ',
                      url: controller.tempat['img1'],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            title: Text('Ganti atau hapus'),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      controller.getImage2(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.image),
                                        Text('From Gallery'),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () async {
                                      controller.hapusImg(2);
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Text('Hapus'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CoverItem(
                      controller: controller,
                      nama: 'Cover 2 ',
                      url: controller.tempat['img2'],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            title: Text('Ganti atau hapus'),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      controller.getImage3(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.image),
                                        Text('From Gallery'),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () async {
                                      controller.hapusImg(3);
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Text('Hapus'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CoverItem(
                      controller: controller,
                      nama: 'Cover 3 ',
                      url: controller.tempat['img3'],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            title: Text('Ganti atau hapus'),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      controller.getImage4(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.image),
                                        Text('From Gallery'),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () async {
                                      controller.hapusImg(4);
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Text('Hapus'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CoverItem(
                      controller: controller,
                      nama: 'Cover 4 ',
                      url: controller.tempat['img4'],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            title: Text('Ganti atau hapus'),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      controller.getImage5(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.image),
                                        Text('From Gallery'),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () async {
                                      controller.hapusImg(5);
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Text('Hapus'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CoverItem(
                      controller: controller,
                      nama: 'Cover 5 ',
                      url: controller.tempat['img5'],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class CoverItem extends StatelessWidget {
  const CoverItem({
    super.key,
    required this.controller,
    required this.nama,
    required this.url,
  });

  final TempatFotoController controller;
  final nama;
  final url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Tema.color400,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: url == null
                ? Image.asset(
                    'assets/image-not-found.jpg',
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.cover,
                    width: 170,
                    height: 100,
                  )
                : Image.network(
                    '${Api.urlImg + url}',
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.cover,
                    width: 170,
                    height: 100,
                  ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${nama}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                    ],
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     hapusImg;
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(4),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(4),
                  //       color: Colors.red,
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Icon(
                  //           Icons.delete,
                  //           color: Colors.white,
                  //         ),
                  //         Text(
                  //           'Hapus',
                  //           style: TextStyle(color: Colors.white),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
