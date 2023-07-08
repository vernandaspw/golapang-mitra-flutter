import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'tempat_olahraga_controller.dart';

class TempatOlahragaPage extends GetView<TempatOlahragaController> {
  const TempatOlahragaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olahraga & Harga'),
        backgroundColor: Tema.color600,
        // actions: [

        //   SizedBox(
        //     width: 5,
        //   ),
        // ],
      ),
      body: Obx(
        () => SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getTempat();
            },
            child: controller.loadingTempat == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container();
                      } else if (index == 1) {
                        return Container(
                          height: 10,
                        );
                      } else if (index == 2) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Olahraga yg tersedia ditempat ini'),
                            ),
                            Obx(
                              () => Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 150,
                                    child: ListView.builder(
                                      reverse: true,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                              .tempat['tempat_olahraga']
                                              .length +
                                          1,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            (controller
                                                        .tempat[
                                                            'tempat_olahraga']
                                                        .length ==
                                                    0
                                                ? 0
                                                : controller
                                                    .tempat['tempat_olahraga']
                                                    .length)) {
                                          return InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    '/tempat-olahraga-baru/${controller.id}');
                                              },
                                              child: Container(
                                                width: 112,
                                                margin: EdgeInsets.all(5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                    color: Tema.color400,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 5,
                                                      )
                                                    ]),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.add),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text('Tambah'),
                                                  ],
                                                ),
                                              ));
                                        }
                                        return InkWell(
                                            onTap: () {
                                              controller.getHargaRegulerHari(
                                                  controller.tempat[
                                                          'tempat_olahraga']
                                                      [index]['id'],
                                                  controller.tempat[
                                                              'tempat_olahraga']
                                                          [index]['olahraga']
                                                      ['nama']);
                                            },
                                            child: Obx(
                                              () => Container(
                                                width: 112,
                                                margin: EdgeInsets.all(5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                    color: controller.tempat[
                                                                    'tempat_olahraga']
                                                                    [index]
                                                                    ['id']
                                                                .toString() ==
                                                            controller
                                                                .tempat_olahraga_id
                                                                .toString()
                                                        ? Tema.color500
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 5,
                                                      )
                                                    ]),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        controller.tempat['tempat_olahraga']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'olahraga']
                                                                    ['img'] !=
                                                                null
                                                            ? Image.network(
                                                                '${Api.urlImg + controller.tempat['tempat_olahraga'][index]['olahraga']['img']}',
                                                                width: 50,
                                                                height: 50,
                                                                fit: BoxFit
                                                                    .cover,
                                                              )
                                                            : Image.asset(
                                                                'assets/image-not-found.jpg'),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          '${controller.tempat['tempat_olahraga'][index]['olahraga']['nama']}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: controller
                                                                          .tempat[
                                                                              'tempat_olahraga']
                                                                              [
                                                                              index]
                                                                              [
                                                                              'id']
                                                                          .toString() ==
                                                                      controller
                                                                          .tempat_olahraga_id
                                                                          .toString()
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.defaultDialog(
                                                          title:
                                                              'Yakin mau hapus?',
                                                          titleStyle: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                          middleText:
                                                              'menghapus olahraga, akan menghapus data harga dan lapangan yg memiliki olahraga tersebut',
                                                          textConfirm: 'Oke',
                                                          textCancel: 'Batal',
                                                          onConfirm: () async {
                                                            controller.hapusOlahraga(
                                                                controller.tempat[
                                                                        'tempat_olahraga']
                                                                    [
                                                                    index]['id']);
                                                            Get.back();
                                                          },
                                                          buttonColor:
                                                              Colors.red,
                                                          confirmTextColor:
                                                              Colors.white,
                                                          cancelTextColor:
                                                              Colors.green,
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Container(
                                                          child: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      } else if (index == 3) {
                        return Obx(
                          () => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.tabHarga.value = 0;
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          color: controller.tabHarga == 0
                                              ? Tema.color500
                                              : Tema.color400,
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              'Harga Reguler',
                                              style: TextStyle(
                                                color: controller.tabHarga == 0
                                                    ? Colors.white
                                                    : Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.tabHarga.value = 1;
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          color: controller.tabHarga == 1
                                              ? Tema.color500
                                              : Tema.color400,
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              'Harga Member',
                                              style: TextStyle(
                                                color: controller.tabHarga == 1
                                                    ? Colors.white
                                                    : Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                              ],
                            ),
                          ),
                        );
                      } else if (index == 4) {
                        return Obx(
                          () => controller.tabHarga == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: controller.hargaRegulerHari.isEmpty
                                          ? Center(
                                              child: Text(
                                                  'Pilih olahraga diatas untuk kelola harga'),
                                            )
                                          : SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Hari(
                                                    controller: controller,
                                                    hari: 'senin'.capitalize,
                                                    bgColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'senin'.capitalize
                                                        ? Tema.color500
                                                        : Tema.color400,
                                                    textColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'senin'.capitalize
                                                        ? Tema.color100
                                                        : Colors.black54,
                                                  ),
                                                  Hari(
                                                    controller: controller,
                                                    hari: 'selasa'.capitalize,
                                                    bgColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'selasa'.capitalize
                                                        ? Tema.color500
                                                        : Tema.color400,
                                                    textColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'selasa'.capitalize
                                                        ? Tema.color100
                                                        : Colors.black54,
                                                  ),
                                                  Hari(
                                                    controller: controller,
                                                    hari: 'rabu'.capitalize,
                                                    bgColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'rabu'.capitalize
                                                        ? Tema.color500
                                                        : Tema.color400,
                                                    textColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'rabu'.capitalize
                                                        ? Tema.color100
                                                        : Colors.black54,
                                                  ),
                                                  Hari(
                                                    controller: controller,
                                                    hari: 'kamis'.capitalize,
                                                    bgColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'kamis'.capitalize
                                                        ? Tema.color500
                                                        : Tema.color400,
                                                    textColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'kamis'.capitalize
                                                        ? Tema.color100
                                                        : Colors.black54,
                                                  ),
                                                  Hari(
                                                    controller: controller,
                                                    hari: 'jumat'.capitalize,
                                                    bgColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'jumat'.capitalize
                                                        ? Tema.color500
                                                        : Tema.color400,
                                                    textColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'jumat'.capitalize
                                                        ? Tema.color100
                                                        : Colors.black54,
                                                  ),
                                                  Hari(
                                                    controller: controller,
                                                    hari: 'sabtu'.capitalize,
                                                    bgColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'sabtu'.capitalize
                                                        ? Tema.color500
                                                        : Tema.color400,
                                                    textColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'sabtu'.capitalize
                                                        ? Tema.color100
                                                        : Colors.black54,
                                                  ),
                                                  Hari(
                                                    controller: controller,
                                                    hari: 'minggu'.capitalize,
                                                    bgColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'minggu'.capitalize
                                                        ? Tema.color500
                                                        : Tema.color400,
                                                    textColor: controller.hari
                                                                .toString()
                                                                .capitalize ==
                                                            'minggu'.capitalize
                                                        ? Tema.color100
                                                        : Colors.black54,
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: controller.hargaRegulers.isEmpty
                                          ? Center(
                                              child: Text('Pilih Hari'),
                                            )
                                          : Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'JAM',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'DISKON',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'HARGA',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'STATUS',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  height: 2,
                                                  thickness: 2,
                                                ),
                                                ListView.builder(
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: controller
                                                      .hargaRegulers.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .hargaItemC
                                                                .text = double.parse(
                                                                    controller.hargaRegulers[
                                                                            index]
                                                                        [
                                                                        'harga'])
                                                                .toInt()
                                                                .toString();
                                                            controller
                                                                    .diskonPersenC
                                                                    .text =
                                                                FormatUang.keNominal(
                                                                    double.parse(
                                                                        controller.hargaRegulers[index]
                                                                            [
                                                                            'diskon_persen']),
                                                                    0);
                                                            if (controller.hargaRegulers[
                                                                        index][
                                                                    'isaktif'] ==
                                                                1) {
                                                              controller
                                                                  .editStatusItem
                                                                  .value = true;
                                                            } else {
                                                              controller
                                                                  .editStatusItem
                                                                  .value = false;
                                                            }
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Obx(
                                                                  () =>
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        1.5,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.symmetric(vertical: 18),
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Tema.color500,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              'Edit ${controller.tempat_olahraga_nama}, ${controller.hari} - ${controller.hargaRegulers[index]['jam']}'.toUpperCase(),
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.white,
                                                                                fontSize: 16,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                                                                child: Text('Harga '),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 4,
                                                                              ),
                                                                              Container(
                                                                                // margin: EdgeInsets.symmetric(horizontal: 10),
                                                                                child: TextField(
                                                                                  controller: controller.hargaItemC,
                                                                                  keyboardType: TextInputType.number,
                                                                                  // onChanged: (value) {
                                                                                  //   print(value);
                                                                                  //   // controller.harga.value = value;
                                                                                  // },
                                                                                  maxLength: 10,
                                                                                  decoration: InputDecoration(
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      borderSide: const BorderSide(width: 1, color: Colors.red),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      borderSide: const BorderSide(width: 1, color: Colors.red),
                                                                                    ),
                                                                                    // errorText: controller.validateOtp,
                                                                                    fillColor: Tema.color400,
                                                                                    filled: true,
                                                                                    border: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      borderSide: BorderSide.none,
                                                                                    ),
                                                                                    hintText: 'Harga',
                                                                                    isDense: true,
                                                                                    contentPadding: const EdgeInsets.symmetric(
                                                                                      vertical: 14,
                                                                                      horizontal: 20,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                                                                child: Text('Diskon % '),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 4,
                                                                              ),
                                                                              Container(
                                                                                // margin: EdgeInsets.symmetric(horizontal: 10),
                                                                                child: TextField(
                                                                                  controller: controller.diskonPersenC,
                                                                                  keyboardType: TextInputType.number,
                                                                                  // onChanged: (value) {
                                                                                  //   print(value);
                                                                                  //   // controller.harga.value = value;
                                                                                  // },
                                                                                  maxLength: 2,
                                                                                  decoration: InputDecoration(
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      borderSide: const BorderSide(width: 1, color: Colors.red),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      borderSide: const BorderSide(width: 1, color: Colors.red),
                                                                                    ),
                                                                                    // errorText: controller.validateOtp,
                                                                                    fillColor: Tema.color400,
                                                                                    filled: true,
                                                                                    border: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      borderSide: BorderSide.none,
                                                                                    ),
                                                                                    hintText: 'Diskon %',
                                                                                    isDense: true,
                                                                                    contentPadding: const EdgeInsets.symmetric(
                                                                                      vertical: 14,
                                                                                      horizontal: 20,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              // SizedBox(
                                                                              //   height: 8,
                                                                              // ),
                                                                              // Text('Harga menjadi ${FormatUang.keIdr(int.parse(controller.hargaItemC.text) - (int.parse(controller.hargaItemC.text) * int.parse(controller.diskonPersenC.text) / 100), 0)}'),
                                                                              SizedBox(
                                                                                height: 8,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.symmetric(horizontal: 0),
                                                                                    child: Text('Status '),
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      if (controller.editStatusItem.value == true) {
                                                                                        controller.editStatusItem.value = false;
                                                                                      } else {
                                                                                        controller.editStatusItem.value = true;
                                                                                      }
                                                                                      print(controller.editStatusItem);
                                                                                    },
                                                                                    child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      width: 80,
                                                                                      decoration: BoxDecoration(
                                                                                        color: controller.editStatusItem == true ? Colors.green : Colors.red,
                                                                                        borderRadius: BorderRadius.circular(
                                                                                          3,
                                                                                        ),
                                                                                      ),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          '${controller.editStatusItem == true ? 'buka' : 'tutup'}',
                                                                                          style: TextStyle(
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 4,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 8,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  if (controller.loadingEditHargaItem == false) {
                                                                                    controller.editHargaItem(controller.hargaRegulers[index]['id']);
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(13),
                                                                                  decoration: BoxDecoration(
                                                                                    color: Tema.color500,
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: controller.loadingEditHargaItem == false
                                                                                        ? Text(
                                                                                            'Simpan',
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          )
                                                                                        : CircularProgressIndicator(color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        2),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${controller.hargaRegulers[index]['jam']}',
                                                                ),
                                                                Text(
                                                                  '${FormatUang.keNominal(double.parse(controller.hargaRegulers[index]['diskon_persen']), 0)}%',
                                                                ),
                                                                double.parse(controller.hargaRegulers[index]
                                                                            [
                                                                            'diskon_persen']) >
                                                                        0
                                                                    ? Row(
                                                                        children: [
                                                                          Text(
                                                                            '${FormatUang.keIdr(double.parse(controller.hargaRegulers[index]['harga']), 0)}',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.red,
                                                                              decoration: TextDecoration.lineThrough,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                              '${FormatUang.keIdr(double.parse(controller.hargaRegulers[index]['harga']) - (double.parse(controller.hargaRegulers[index]['harga']) * double.parse(controller.hargaRegulers[index]['diskon_persen']) / 100), 0)}'),
                                                                        ],
                                                                      )
                                                                    : Text(
                                                                        '${FormatUang.keIdr(double.parse(controller.hargaRegulers[index]['harga']), 0)}',
                                                                      ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    controller.editHargaItemToggle(
                                                                        controller.hargaRegulers[index]
                                                                            [
                                                                            'id']);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .symmetric(
                                                                      vertical:
                                                                          10,
                                                                      horizontal:
                                                                          18,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: controller.hargaRegulers[index]['isaktif'] == 1
                                                                          ? Tema
                                                                              .color500
                                                                          : Colors
                                                                              .red,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child: controller.loadingToggle ==
                                                                              false
                                                                          ? Text(
                                                                              '${controller.hargaRegulers[index]['isaktif'] == 1 ? 'buka' : 'tutup'}',
                                                                              style: TextStyle(
                                                                                fontSize: 13,
                                                                                color: controller.hargaRegulers[index]['isaktif'] == 1 ? Colors.white : Colors.black54,
                                                                              ),
                                                                            )
                                                                          : Container(
                                                                              width: 19,
                                                                              height: 15,
                                                                              child: CircularProgressIndicator(
                                                                                color: Colors.white,
                                                                                strokeWidth: 2,
                                                                              ),
                                                                            ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 2,
                                                          thickness: 2,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              ],
                                            ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Harga Member'),
                                    ],
                                  ),
                                ),
                        );
                      } else if (index == 5) {
                        return SizedBox(
                          height: 30,
                        );
                        // return Obx(
                        //   () => Column(
                        //     children: [

                        //     ],
                        //   ),
                        // );
                      }
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

// class OlahragaWidget extends StatelessWidget {
//   const OlahragaWidget({
//     super.key,
//     required this.controller,
//     required this.id,
//     required this.img,
//     required this.nama,
//     required this.bgColor,
//     required this.textColor,
//   });

//   final TempatOlahragaController controller;
//   final id;
//   final img;
//   final nama;
//   final bgColor;
//   final textColor;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.getHargaRegulerHari(controller.tempat['tempat_olahraga']
//                                           [index]['id'], controller.tempat['tempat_olahraga']
//                                           [index]['olahraga']['nama']);
//       },
//       child: Container(
//         // width: 100,
//         margin: EdgeInsets.all(5),
//         padding: EdgeInsets.symmetric(horizontal: 15),
//         decoration: BoxDecoration(
//             color: controller
//                                                   .tempat['tempat_olahraga']
//                                                       [index]['id']
//                                                   .toString() ==
//                                               controller.tempat_olahraga_id
//                                                   .toString()
//                                           ? Tema.color500
//                                           : Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: Offset(0, 3),
//                 blurRadius: 5,
//               )
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 controller.tempat['tempat_olahraga']
//                                           [index]['olahraga']['img'] != null
//                     ? Image.network(
//                         '${Api.urlImg + controller.tempat['tempat_olahraga']
//                                           [index]['olahraga']['img']}',
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       )
//                     : Image.asset('assets/image-not-found.jpg'),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text(
//                   '${controller.tempat['tempat_olahraga']
//                                           [index]['olahraga']['nama']}',
//                   style: TextStyle(color: controller
//                                                   .tempat['tempat_olahraga']
//                                                       [index]['id']
//                                                   .toString() ==
//                                               controller.tempat_olahraga_id
//                                                   .toString()
//                                           ? Colors.white
//                                           : Colors.black),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 4,
//             ),
//             InkWell(
//               onTap: () {
//                 Get.defaultDialog(
//                   title: 'Yakin mau hapus?',
//                   titleStyle: TextStyle(color: Colors.red),
//                   middleText:
//                       'menghapus olahraga, akan menghapus data harga dan lapangan yg memiliki olahraga tersebut',
//                   textConfirm: 'Oke',
//                   textCancel: 'Batal',
//                   onConfirm: () async {
//                     controller.hapusOlahraga(controller.tempat['tempat_olahraga']
//                                           [index]['id']);
//                     Get.back();
//                   },
//                   buttonColor: Colors.red,
//                   confirmTextColor: Colors.white,
//                   cancelTextColor: Colors.green,
//                 );
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Container(
//                   child: Icon(
//                     Icons.delete,
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Hari extends StatelessWidget {
  const Hari({
    super.key,
    required this.controller,
    required this.hari,
    required this.bgColor,
    required this.textColor,
  });

  final TempatOlahragaController controller;
  final hari;
  final bgColor;
  final textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getHargaReguler('${hari}');
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: BoxDecoration(
            color: bgColor,
          ),
          child: Text(
            '${hari}',
            style: TextStyle(color: textColor),
          )),
    );
  }
}
