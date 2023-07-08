import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';
import 'package:image_picker/image_picker.dart';

import 'lapangan_detail_controller.dart';

class LapanganDetailPage extends GetView<LapanganDetailController> {
  const LapanganDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lapangan Detail'),
        // centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.getLapangan();
          },
          child: controller.loadingLapangan == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Container(
                      color: controller.lapangan['isaktif'] == 1
                          ? Tema.color500
                          : Colors.redAccent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              '${controller.lapangan['isaktif'] == 1 ? 'Buka' : 'Tutup'}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          // GetBuilder<MitraController>(
                          //   init: MitraController(),
                          //   builder: (_) => controller.image == null
                          //       ? Text('No image selected.')
                          //       : Image.file(controller.image!),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          title: Text('Ganti atau hapus'),
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            child: Column(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                    controller.getImage(
                                                        ImageSource.gallery);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.image),
                                                      Text('From Gallery'),
                                                    ],
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
                                                  onPressed: () async {
                                                    controller.hapusImg();
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
                                  child: Container(
                                    child: controller.lapangan['img'] == null
                                        ? Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                'assets/image-not-found.jpg',
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                '${Api.urlImg + controller.lapangan['img']}',
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                            '/lapangan-edit/${controller.tempat_id}/${controller.lapangan_id}');
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama lapangan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${controller.lapangan['nama']}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Icon(Icons.edit_sharp)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                            '/lapangan-edit/${controller.tempat_id}/${controller.lapangan_id}');
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Olahraga',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${controller.lapangan['tempat_olahraga']['olahraga']['nama']}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Icon(Icons.edit_sharp)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                            '/lapangan-edit/${controller.tempat_id}/${controller.lapangan_id}');
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tipe lapangan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${controller.lapangan['tipe_lapangan'] != null ? controller.lapangan['tipe_lapangan']['nama'] : '-'}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Icon(Icons.edit_sharp)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                            '/lapangan-edit/${controller.tempat_id}/${controller.lapangan_id}');
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Alas lapangan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${controller.lapangan['alas_lapangan'] != null ? controller.lapangan['alas_lapangan']['nama'] : '-'}',
                                    // style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Icon(Icons.edit_sharp)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Container(
                    //   color: Colors.white,
                    //   padding: EdgeInsets.symmetric(vertical: 12),
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 10),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Text('Status '),
                          ),
                          InkWell(
                            onTap: () {
                              controller.updateIsaktifLapangan(
                                  controller.lapangan_id);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              width: 80,
                              decoration: BoxDecoration(
                                color: controller.lapangan['isaktif'] == 1
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(
                                  3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${controller.lapangan['isaktif'] == 1 ? 'buka' : 'tutup'}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Yakin mau hapus?',
                            middleText: 'Klik hapus untuk menghapus lapangan',
                            onConfirm: () async {
                              controller.hapusLapangan();
                            },
                            buttonColor: Colors.red,
                            textConfirm: 'Hapus',
                            confirmTextColor: Colors.white,
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                'Hapus Lapangan',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
