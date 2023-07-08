import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'dompet_tarik_controller.dart';

class DompetTarikPage extends GetView<DompetTarikController> {
  const DompetTarikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarik Saldo'),
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
                  controller.getBank();
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
                              'Saldo : ${FormatUang.keIdr(controller.saldo.toInt(), 0)}'),
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
                          Text('Nominal Tarik'),
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

                            controller.total.value =
                                controller.nominal.toInt() +
                                    controller.fee.toInt();
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
                          hintText: 'Nominal tarik',
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
                    Divider(
                      thickness: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Kirim ke rekening',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownSearch<dynamic>(
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Pilih Bank",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        items: controller.banks,
                        popupProps: PopupProps.dialog(
                          title: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Pilih Bank'),
                          ),
                          showSearchBox: true,
                          itemBuilder: (context, item, isSelected) {
                            return Container(
                              margin: EdgeInsetsDirectional.symmetric(
                                  horizontal: 10),
                              child: Row(
                                children: [
                                  Image.network(
                                    '${Api.urlImg + item['img']}',
                                    width: 72,
                                    height: 51,
                                    fit: BoxFit.fill,
                                    loadingBuilder: (BuildContext context,
                                        Widget child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object exception, stackTrace) {
                                      return Text('Failed load img');
                                    },
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${item['nama']}'),
                                      Text(
                                        'Fee ${FormatUang.keIdr(double.parse(item['fee']), 0)}',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          // disabledItemFn: (String s) => s.startsWith('Pilih'),
                        ),
                        dropdownBuilder: (context, selectedItem) {
                          return Text(
                              selectedItem?['nama'].toString() ?? 'Pilih');
                        },
                        onChanged: (value) {
                          controller.bank_id.value = value['id'].toString();
                          controller.bank_nama.value = value['nama'].toString();
                          controller.fee.value =
                              double.parse(value['fee']).toInt();
                          controller.total.value = controller.nominal.toInt() +
                              controller.fee.toInt();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text('Atas Nama'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: controller.anC,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          controller.an.value = value.toString();
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
                          hintText: 'Atas nama',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text('Nomor rekening / ponsel'),
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
                        controller: controller.norekC,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.norek.value = value.toString();
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
                          hintText: 'Nomor rekening / ponsel',
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
                    Divider(thickness: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text('Kode OTP'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: controller.otpC,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.otp.value = value;
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
                          hintText: 'Kode OTP',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(() => Row(
                            children: [
                              Expanded(
                                child: controller.loadingEmail == false
                                    ? InkWell(
                                        onTap: () async {
                                          controller.sendOtpEmail();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Tema.color400,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: Text('kirim otp ke email'),
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Tema.color400,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: controller.loadingWa == false
                                    ? InkWell(
                                        onTap: () {
                                          controller.sendOtpWa();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Tema.color400,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: Text('kirim otp ke wa'),
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Tema.color400,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Divider(thickness: 6),
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
                          Text('Fee'),
                          Text(
                              '${FormatUang.keNominal(controller.fee.toInt(), 0)}'),
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
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${FormatUang.keIdr(controller.total.toDouble(), 0)}',
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
                      child: controller.loadingTarik == false
                          ? InkWell(
                              onTap: () {
                                controller.tarik();
                              },
                              child: Container(
                                color: Tema.color500,
                                padding: EdgeInsets.all(12),
                                child: Center(
                                  child: Text('tarik',
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
                    // Divider(thickness: 6),
                  ],
                ),
              ),
      ),
    );
  }
}
