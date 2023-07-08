import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';
import 'package:intl/intl.dart';

import 'tempat_jam_operasional_controller.dart';

class TempatJamOperasionalPage extends GetView<TempatJamOperasionalController> {
  const TempatJamOperasionalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jam Operasional Tempat'),
        // centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: Obx(() => RefreshIndicator(
          onRefresh: () async {
            controller.getTempat();
          },
          child: controller.loadingTempat == true
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: controller
                                .tempat['tempat_jam_operasional']
                                .length, // number of items in the list,
                            itemBuilder: (context, index) {
                              return Table(
                                children: [
                                  TableRow(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 13),
                                        child: Text(
                                            '${controller.tempat['tempat_jam_operasional'][index]['hari']}'),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          controller.timeStart(
                                              controller.tempat[
                                                      'tempat_jam_operasional']
                                                  [index]['id'],
                                              context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Tema.color400,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: Center(
                                            child: Text(
                                              '${controller.tempat['tempat_jam_operasional'][index]['jam_buka']}',
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: Center(child: Text('-'))),
                                      InkWell(
                                        onTap: () async {
                                          controller.timeEnd(
                                              controller.tempat[
                                                      'tempat_jam_operasional']
                                                  [index]['id'],
                                              context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Tema.color400,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: Center(
                                            child: Text(
                                              '${controller.tempat['tempat_jam_operasional'][index]['jam_tutup']}',
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(''),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3),
                                        child: InkWell(
                                          onTap: () {
                                            controller.buka(controller.tempat[
                                                    'tempat_jam_operasional']
                                                [index]['id']);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: controller.tempat[
                                                              'tempat_jam_operasional']
                                                          [index]['buka'] ==
                                                      1
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${controller.tempat['tempat_jam_operasional'][index]['buka'] == 1 ? 'buka' : 'libur'}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ))),
    );
  }
}
