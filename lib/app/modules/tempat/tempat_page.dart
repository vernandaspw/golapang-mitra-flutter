import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'tempat_controller.dart';

class TempatPage extends GetView<TempatController> {
  const TempatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat (Cabang)'),
        // centerTitle: true,
        backgroundColor: Tema.color600,
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed('/premium');
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 11),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Tema.color100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  'Tempat baru',
                  style: TextStyle(
                    color: Tema.color800,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Tema.color400,
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(10),
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getTempat();
            },
            child: controller.loadingTempat == true
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.tempat.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              8,
                            )),
                        child: InkWell(
                            onTap: () {
                              Get.toNamed(
                                  '/tempat/tempat-detail/${controller.tempat[index]['id']}');
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.tempat[index]['nama']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        '${controller.tempat[index]['kecamatan']}, ${controller.tempat[index]['kota']['nama']}, ${controller.tempat[index]['provinsi']['nama']} ',
                                      ),
                                      Text(
                                          '${controller.tempat[index]['alamat']}')
                                    ],
                                  ),
                                  Switch(
                                    activeColor: Tema.color600,
                                    value:
                                        controller.tempat[index]['isopen'] == 1
                                            ? true
                                            : false,
                                    onChanged: (value) {
                                      controller.toggleIsOpen(
                                          controller.tempat[index]['id'],
                                          value);
                                    },
                                  )
                                ],
                              ),
                            )),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
