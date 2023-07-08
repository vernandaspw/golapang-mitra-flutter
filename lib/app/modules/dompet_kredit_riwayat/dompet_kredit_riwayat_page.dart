import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'dompet_kredit_riwayat_controller.dart';

class DompetKreditRiwayatPage extends GetView<DompetKreditRiwayatController> {
  const DompetKreditRiwayatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dompet kredit riwayat'),
          centerTitle: true,
          backgroundColor: Tema.color500,
        ),
        body: Obx(() => SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Terbaru',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                controller.riwayat.isEmpty
                    ? Center(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Belum ada transaksi',
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        child: Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              controller.getRiwayat();
                            },
                            child: ListView.builder(
                              controller: controller.scrollController,
                              itemCount: controller.riwayat.length + 1,
                              itemBuilder: (context, index) {
                                if (index == controller.riwayat.length) {
                                  return controller.loadingData == true
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Container();
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          '/dompet-kredit-detail/${controller.riwayat[index]['id']}');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 7),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: controller.riwayat[index]
                                                      ['status_admin'] ==
                                                  'pembayaran'
                                              ? controller.riwayat[index][
                                                          'pembayaran_expired'] ==
                                                      true
                                                  ? Tema.color400
                                                  : Tema.color700
                                              : Tema.color400,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 2,
                                              color: Tema.color500,
                                            ),
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${controller.riwayat[index]['no']}',
                                                style: TextStyle(
                                                  color: controller.riwayat[
                                                                  index][
                                                              'status_admin'] ==
                                                          'pembayaran'
                                                      ? controller.riwayat[
                                                                      index][
                                                                  'pembayaran_expired'] ==
                                                              true
                                                          ? Tema.color700
                                                          : Tema.color400
                                                      : Tema.color700,
                                                ),
                                              ),
                                              Text(
                                                '${controller.riwayat[index]['created_at'].toLowerCase()}',
                                                style: TextStyle(
                                                  color: controller.riwayat[
                                                                  index][
                                                              'status_admin'] ==
                                                          'pembayaran'
                                                      ? controller.riwayat[
                                                                      index][
                                                                  'pembayaran_expired'] ==
                                                              true
                                                          ? Tema.color700
                                                          : Tema.color400
                                                      : Tema.color700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(height: 7, thickness: 1),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${controller.riwayat[index]['kategori']}',
                                                    style: TextStyle(
                                                      color: controller.riwayat[
                                                                      index][
                                                                  'status_admin'] ==
                                                              'pembayaran'
                                                          ? controller.riwayat[
                                                                          index]
                                                                      [
                                                                      'pembayaran_expired'] ==
                                                                  true
                                                              ? Tema.color700
                                                              : Tema.color400
                                                          : Tema.color700,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' - ',
                                                    style: TextStyle(
                                                      color: controller.riwayat[
                                                                      index][
                                                                  'status_admin'] ==
                                                              'pembayaran'
                                                          ? controller.riwayat[
                                                                          index]
                                                                      [
                                                                      'pembayaran_expired'] ==
                                                                  true
                                                              ? Tema.color700
                                                              : Tema.color400
                                                          : Tema.color700,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${controller.riwayat[index]['status']}',
                                                    style: TextStyle(
                                                      color: controller.riwayat[
                                                                      index][
                                                                  'status_admin'] ==
                                                              'pembayaran'
                                                          ? controller.riwayat[
                                                                          index]
                                                                      [
                                                                      'pembayaran_expired'] ==
                                                                  true
                                                              ? Tema.color700
                                                              : Tema.color400
                                                          : Tema.color700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${controller.riwayat[index]['created_at_human'].toLowerCase()}',
                                                style: TextStyle(
                                                  color: controller.riwayat[
                                                                  index][
                                                              'status_admin'] ==
                                                          'pembayaran'
                                                      ? controller.riwayat[
                                                                      index][
                                                                  'pembayaran_expired'] ==
                                                              true
                                                          ? Tema.color700
                                                          : Tema.color400
                                                      : Tema.color700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${controller.riwayat[index]['jenis'] == 'masuk' ? '+' : '-'} ${FormatUang.keIdr(double.parse(controller.riwayat[index]['nominal']), 0)}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: controller.riwayat[
                                                                  index][
                                                              'status_admin'] ==
                                                          'pembayaran'
                                                      ? controller.riwayat[
                                                                      index]
                                                                  ['jenis'] ==
                                                              'masuk'
                                                          ? Colors.green
                                                          : Colors.red
                                                      : Tema.color700,
                                                ),
                                              ),
                                              Text(
                                                'Oleh ${controller.riwayat[index]['mitra_user']['nama']}',
                                                style: TextStyle(
                                                  color: controller.riwayat[
                                                                  index][
                                                              'status_admin'] ==
                                                          'pembayaran'
                                                      ? controller.riwayat[
                                                                      index][
                                                                  'pembayaran_expired'] ==
                                                              true
                                                          ? Tema.color700
                                                          : Tema.color400
                                                      : Tema.color700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          controller.riwayat[index]['status'] ==
                                                  'pembayaran'
                                              ? controller.riwayat[index][
                                                          'pembayaran_expired'] ==
                                                      true
                                                  ? Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 2, 0, 0),
                                                      child: Text(
                                                        'Pembayaran Expired, ${controller.riwayat[index]['pembayaran_expired_at']}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 2, 0, 0),
                                                      child: Text(
                                                        'Bayar sebelum ${controller.riwayat[index]['pembayaran_expired_at']} (${controller.riwayat[index]['pembayaran_expired_at_human'].toString()})',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.amber,
                                                        ),
                                                      ),
                                                    )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      )
              ],
            ))));
  }
}
