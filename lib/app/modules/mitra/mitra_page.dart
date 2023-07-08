import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';
import 'package:image_picker/image_picker.dart';

import 'mitra_controller.dart';

class MitraPage extends GetView<MitraController> {
  const MitraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mitra'),
        centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: Obx(
        () => SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getMe();
            },
            child: controller.loadingMe == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Container(
                        color: controller.me['mitra']['isaktif'] == 1
                            ? Tema.color500
                            : Colors.redAccent,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Status : ${controller.me['mitra']['isaktif'] == 1 ? 'aktif' : 'tidak aktif'}',
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
                            // GetBuilder<MitraController>(
                            //   init: MitraController(),
                            //   builder: (_) => controller.image == null
                            //       ? Text('No image selected.')
                            //       : Image.file(controller.image!),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      controller.getImage(ImageSource.gallery);
                                    },
                                    child: Container(
                                      child: controller.me['mitra']['logo'] ==
                                              null
                                          ? CircleAvatar(
                                              radius: 33,
                                              backgroundColor: Tema.color700,
                                              child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage(
                                                      'assets/logo/gl-bg-white.jpg')),
                                            )
                                          : CircleAvatar(
                                              radius: 33,
                                              backgroundColor: Tema.color700,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                  '${Api.urlImg + controller.me['mitra']['logo']}',
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
                          Get.toNamed('/mitra/mitra-edit');
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
                                      'Nama',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${controller.me['mitra']['nama']}',
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
                          Get.toNamed('/mitra/mitra-edit');
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
                                      'Deskripsi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${controller.me['mitra']['deskripsi']}',
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
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
