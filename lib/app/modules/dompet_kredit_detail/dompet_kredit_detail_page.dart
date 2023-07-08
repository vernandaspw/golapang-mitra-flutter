import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'dompet_kredit_detail_controller.dart';

class DompetKreditDetailPage extends GetView<DompetKreditDetailController> {
  const DompetKreditDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = controller.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dompet Kredit Detail'),
        centerTitle: true,
        backgroundColor: Tema.color500,
      ),
      body: Obx(
        () => SafeArea(
            child: controller.loadingData == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: Tema.color400,
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.getData();
                    },
                    child: ListView(
                      children: [
                        data['status'] == 'berhasil' ||
                                data['status'] == 'gagal' ||
                                data['status'] == 'batal'
                            ? Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      '${data['status'] == 'berhasil' ? 'Transaksi Berhasil' : data['status'] == 'gagal' ? 'Pembayaran gagal' : 'Pembayaran Batal'}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                        color: data['status'] == 'berhasil'
                                            ? Tema.color500
                                            : Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 6,
                        ),
                        Column(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${data['jenis']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: data['jenis'] == 'masuk'
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                      Text(
                                        '${data['kategori'] == 'isi' ? 'topup' : data['kategori']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'No transaksi',
                                      ),
                                      Text(
                                        '${data['no']}',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nominal',
                                      ),
                                      Text(
                                        '${FormatUang.keIdr(double.parse(data['nominal']), 0)}',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Oleh',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${data['mitra_user']['nama']}',
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Divider(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Keterangan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${data['keterangan'] != null ? data['keterangan'] : '-'}',
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
