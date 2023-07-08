import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';
import 'package:image_picker/image_picker.dart';

import 'dompet_detail_controller.dart';

class DompetDetailPage extends GetView<DompetDetailController> {
  const DompetDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = controller.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dompet Detail'),
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
                        data['kategori'] == 'isi'
                            ? data['status'] == 'pembayaran' ||
                                    data['status'] == 'proses'
                                ? Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'ISI SALDO',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Tema.color500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          data['status'] == 'pembayaran' &&
                                                  data['pembayaran_expired'] ==
                                                      true
                                              ? Column(
                                                  children: [
                                                    Text(
                                                      'Pembayaran Telah Expired',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 19,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Expired pada ',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${data['pembayaran_expired_at']}',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    data['status'] ==
                                                            'pembayaran'
                                                        ? Text(
                                                            'Pembayaran Belum Selesai',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 19,
                                                            ),
                                                          )
                                                        : Container(),
                                                    data['status'] == 'proses'
                                                        ? Text(
                                                            'Pembayaran Sedang diproses',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.amber,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 19,
                                                            ),
                                                          )
                                                        : Container(),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Transfer',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 19,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      '${FormatUang.keIdr(double.parse(data['total_pembayaran']), 0)}',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 19,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Sebelum ${data['pembayaran_expired_at']}',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // fontSize: 19,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    data['metode_pembayaran']
                                                                ['nama'] ==
                                                            'manual'
                                                        ? Column(
                                                            children: [
                                                              Text(
                                                                  'Ke rekening'),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Tema
                                                                      .color400,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    6,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    data['bank_perusahaan']['img'] ==
                                                                            null
                                                                        ? Image
                                                                            .asset(
                                                                            '/assets/image-not-found.jpg',
                                                                            width:
                                                                                72,
                                                                            height:
                                                                                51,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          )
                                                                        : Image
                                                                            .network(
                                                                            '${Api.urlImg + data['bank_perusahaan']['img']}',
                                                                            width:
                                                                                72,
                                                                            height:
                                                                                51,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            loadingBuilder: (BuildContext context,
                                                                                Widget child,
                                                                                loadingProgress) {
                                                                              if (loadingProgress == null)
                                                                                return child;
                                                                              return Center(
                                                                                child: CircularProgressIndicator(
                                                                                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                                                ),
                                                                              );
                                                                            },
                                                                            errorBuilder: (BuildContext context,
                                                                                Object exception,
                                                                                stackTrace) {
                                                                              return Text('Failed load img');
                                                                            },
                                                                          ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          '${data['bank_perusahaan']['nama']}',
                                                                          style:
                                                                              TextStyle(fontSize: 15),
                                                                        ),
                                                                        Text(
                                                                          '${data['bank_perusahaan']['an']}',
                                                                          style:
                                                                              TextStyle(fontSize: 15),
                                                                        ),
                                                                        Text(
                                                                          '${data['bank_perusahaan']['norek']}',
                                                                          style:
                                                                              TextStyle(fontSize: 15),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              data['status'] ==
                                                                      'pembayaran'
                                                                  ? Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      'Setelah transfer, Konfirm pembayaran dengan upload bukti pembayaran',
                                                                    )
                                                                  : Container(),
                                                              data['status'] ==
                                                                      'proses'
                                                                  ? Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      'Pembayaran sedang di cek oleh admin 1x24 jam kerja',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    )
                                                                  : Container(),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.getImage(
                                                                      ImageSource
                                                                          .gallery);
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    color: Tema
                                                                        .color500,
                                                                  ),
                                                                  child: Text(
                                                                    '${data['status'] == 'pembayaran' ? 'Upload Bukti Pembayaran' : 'Perbarui bukti pembayaran'}',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(
                                                            height: 15,
                                                          ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container()
                            : data['status'] == 'proses'
                                ? Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'TARIK SALDO',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Tema.color500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            children: [
                                              data['status'] == 'proses'
                                                  ? Text(
                                                      'Penarikan Sedang diproses',
                                                      style: TextStyle(
                                                        color: Colors.amber,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 19,
                                                      ),
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                textAlign: TextAlign.center,
                                                '${FormatUang.keIdr(double.parse(data['nominal']), 0)} akan dikirim ke rekening',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
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
                                    data['kategori'] == 'tarik'
                                        ? Text(
                                            textAlign: TextAlign.center,
                                            '${FormatUang.keIdr(double.parse(data['nominal']), 0)} ${data['status'] == 'berhasil' ? 'telah dikirim ke rekening' : 'saldo telah kembali'}',
                                            style: TextStyle(
                                              // color: Colors.green,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          )
                                        : Container(),
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
                                        'Kode unik',
                                      ),
                                      Text(
                                        '${FormatUang.keNominal(double.parse(data['kode_unik']), 0)}',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fee',
                                      ),
                                      Text(
                                        '${FormatUang.keNominal(double.parse(data['fee']), 0)}',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${FormatUang.keIdr(double.parse(data['total_pembayaran']), 0)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
