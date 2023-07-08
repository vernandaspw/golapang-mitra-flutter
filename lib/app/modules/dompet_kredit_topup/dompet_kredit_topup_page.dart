import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'dompet_kredit_topup_controller.dart';

class DompetKreditTopupPage extends GetView<DompetKreditTopupController> {
  const DompetKreditTopupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Saldo Kredit'),
        centerTitle: true,
        backgroundColor: Tema.color500,
      ),
      body: Obx(
        () => controller.loadingData == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  // controller.getSetting();
                },
                child: ListView(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Sumber dana',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   '*Semua hari & jam',
                          //   style: TextStyle(
                          //     color: Colors.black45,
                          //     fontSize: 13,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                              'Saldo Utama : ${FormatUang.keIdr(controller.saldo.toInt(), 0)}'),
                          // Text(
                          //   '*Semua hari & jam',
                          //   style: TextStyle(
                          //     color: Colors.black45,
                          //     fontSize: 13,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text('Nominal Isi saldo kredit'),
                          // Text(
                          //   '*Semua hari & jam',
                          //   style: TextStyle(
                          //     color: Colors.black45,
                          //     fontSize: 13,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: controller.nominalC,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.nominal.value = int.parse(value);
                          }
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                          ),
                          // errorText: controller.validateOtp,
                          fillColor: Tema.color400,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Nominal isi kredit',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(thickness: 4),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nominal'),
                          Text(
                              '${FormatUang.keIdr(controller.nominal.toDouble(), 0)}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: controller.loadingIsi == false
                          ? InkWell(
                              onTap: () {
                                controller.isi();
                              },
                              child: Container(
                                color: Tema.color500,
                                padding: EdgeInsets.all(12),
                                child: Center(
                                  child: Text('Bayar',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {},
                              child: Container(
                                  color: Tema.color500,
                                  padding: EdgeInsets.all(12),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                    ),
                    Divider(thickness: 4),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keterangan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Digunakan untuk',
                            style: TextStyle(),
                          ),
                          Text(
                            '- transaksi fee untuk mitra',
                            style: TextStyle(),
                          ),
                          Text(
                            '- transaksi fee untuk customer (jika pembayaran langsung ke mitra)',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
