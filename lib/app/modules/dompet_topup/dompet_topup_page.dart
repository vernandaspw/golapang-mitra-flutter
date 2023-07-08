import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'dompet_topup_controller.dart';

class DompetTopupPage extends GetView<DompetTopupController> {
  const DompetTopupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topup Saldo'),
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
                  controller.getSetting();
                  controller.getKodeUnik();
                  controller.getMetodePembayaran();
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
                          Text('Nominal Topup'),
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

                            controller.total_pembayaran.value =
                                controller.nominal.toInt() +
                                    controller.kode_unik.toInt() +
                                    controller.fee.toInt() +
                                    controller.fee_vendor.toInt();
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
                          hintText: 'Nominal topup',
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownSearch<dynamic>(
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Pilih Metode Pembayaran",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        items: controller.metode_pembayarans,
                        popupProps: PopupProps.dialog(
                          title: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Pilih Metode Pembayaran'),
                          ),
                          showSearchBox: true,
                          itemBuilder: (context, item, isSelected) {
                            return ListTile(
                              textColor: Colors.black,
                              title: Text('${item['nama']}'),
                            );
                          },
                          // disabledItemFn: (String s) => s.startsWith('Pilih'),
                        ),
                        dropdownBuilder: (context, selectedItem) {
                          return Text(
                              selectedItem?['nama'].toString() ?? 'Pilih');
                        },
                        onChanged: (value) {
                          controller.metode_pembayaran_id.value =
                              value['id'].toString();

                          controller.metode_pembayaran_nama.value =
                              value['nama'].toString();

                          if (value['nama'].toString() == 'manual') {
                            controller
                                .getBankPerusahaan(value['id'].toString());
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    controller.bank_perusahaans.isEmpty
                        ? SizedBox()
                        : Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: DropdownSearch<dynamic>(
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Pilih Bank",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  items: controller.bank_perusahaans,
                                  popupProps: PopupProps.dialog(
                                    title: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text('Pilih bank'),
                                    ),
                                    showSearchBox: true,
                                    itemBuilder: (context, item, isSelected) {
                                      return Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                item['img'] == null
                                                    ? Image.asset(
                                                        '/assets/image-not-found.jpg',
                                                        width: 72,
                                                        height: 51,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.network(
                                                        '${Api.urlImg + item['img']}',
                                                        width: 72,
                                                        height: 51,
                                                        fit: BoxFit.fill,
                                                      ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${item['nama']}',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      '${item['an']}',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      '${item['norek']}',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                          )
                                        ],
                                      );
                                      // ListTile(
                                      //   textColor: Colors.black,
                                      //   title: Text('${item['nama']}'),
                                      // );
                                    },
                                    // disabledItemFn: (String s) => s.startsWith('Pilih'),
                                  ),
                                  dropdownBuilder: (context, selectedItem) {
                                    return Text(
                                        selectedItem?['nama'].toString() ??
                                            'Pilih');
                                  },
                                  onChanged: (value) {
                                    controller.bank_perusahaan_id.value =
                                        value['id'].toString();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kode unik'),
                          Text('${controller.kode_unik.toInt()}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fee'),
                          Text('${controller.fee}'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Bayar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${FormatUang.keIdr(controller.total_pembayaran.toDouble(), 0)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text('Fee Payment Getway'),
                    //       Text('${controller.fee_vendor}'),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: controller.loadingBayar == false
                          ? InkWell(
                              onTap: () {
                                controller.bayar();
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
                            '- minimal topup ${FormatUang.keIdr(controller.minimal_topup.toInt(), 0)}',
                            style: TextStyle(),
                          ),
                          Text(
                            '- maksimal topup ${FormatUang.keIdr(controller.max_topup.toInt(), 0)}',
                            style: TextStyle(),
                          ),
                          Text(
                            '- topup dengan metode pembayaran manual paling lambat 1x24 jam kerja',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Jam Operasional',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '- Senin,    08:00 - 16:00',
                            style: TextStyle(),
                          ),
                          Text(
                            '- Selasa,  08:00 - 16:00',
                            style: TextStyle(),
                          ),
                          Text(
                            '- Rabu,     08:00 - 16:00',
                            style: TextStyle(),
                          ),
                          Text(
                            '- Kamis,   08:00 - 16:00',
                            style: TextStyle(),
                          ),
                          Text(
                            '- Jumat,   08:00 - 16:00',
                            style: TextStyle(),
                          ),
                          Text(
                            '- Sabtu,    08:00 - 15:00',
                            style: TextStyle(),
                          ),
                          Text(
                            '- Minggu, Libur',
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
