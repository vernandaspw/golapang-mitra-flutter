import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'tempat_detail_controller.dart';

class TempatDetailPage extends GetView<TempatDetailController> {
  const TempatDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat Olahraga'),
        centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.getTempat();
          },
          child: controller.loadingTempat == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Container(
                      color: controller.tempat['isopen'] == 1
                          ? Tema.color500
                          : Colors.red,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              '${controller.tempat['isopen'] == 1 ? 'Terima orderan' : 'Tutup orderan'}',
                              style: TextStyle(
                                color: controller.tempat['isopen'] == 1
                                    ? Colors.white
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: Text(
                              'Status tempat: ${controller.tempat['isaktif'] == 1 ? 'aktif' : 'tidak aktif'}',
                              style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 13,
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
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Cover Foto Tempat Olahraga',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    controller.tempat['img1'] == null
                                        ? SizedBox()
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Image.network(
                                              '${Api.urlImg + controller.tempat['img1']}',
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                    controller.tempat['img2'] == null
                                        ? SizedBox()
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Image.network(
                                              '${Api.urlImg + controller.tempat['img2']}',
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                    controller.tempat['img3'] == null
                                        ? SizedBox()
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Image.network(
                                              '${Api.urlImg + controller.tempat['img3']}',
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                    controller.tempat['img4'] == null
                                        ? SizedBox()
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Image.network(
                                              '${Api.urlImg + controller.tempat['img4']}',
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                    controller.tempat['img5'] == null
                                        ? SizedBox()
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Image.network(
                                              '${Api.urlImg + controller.tempat['img5']}',
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                  '/tempat/tempat-detail/tempat-foto/${controller.id}');
                            },
                            child: Container(
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Icon(
                                Icons.edit,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Nama',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${controller.tempat['nama']}',
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                  '/tempat/tempat-detail/tempat-edit/${controller.id}');
                            },
                            child: Container(
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Icon(
                                Icons.edit,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Deskripsi',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${controller.tempat['deskripsi']}',
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    // Icon(
                                    //   Icons.edit,
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                  '/tempat/tempat-detail/tempat-edit/${controller.id}');
                            },
                            child: Container(
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Icon(
                                Icons.edit,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Telp',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${controller.tempat['telp']}',
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    // Icon(
                                    //   Icons.edit,
                                    // )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                  '/tempat/tempat-detail/tempat-edit/${controller.id}');
                            },
                            child: Container(
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Icon(
                                Icons.edit,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Alamat tempat olahraga',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                  '/tempat/tempat-detail/tempat-alamat/${controller.id}');
                            },
                            child: Container(
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Icon(
                                Icons.edit,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Provinsi',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${controller.tempat['provinsi']['nama']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    // Icon(
                                    //   Icons.edit,
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Kota',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${controller.tempat['kota']['nama']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    // Icon(
                                    //   Icons.edit,
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Kecamatan',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${controller.tempat['kecamatan']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    // Icon(
                                    //   Icons.edit,
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Alamat',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${controller.tempat['alamat']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    // Icon(
                                    //   Icons.edit,
                                    // )
                                  ],
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

                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Jam Operasional',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      '/tempat/tempat-detail/tempat-jam-operasional/${controller.id}');
                                },
                                child: Container(
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: Icon(
                                    Icons.edit,
                                  ),
                                ),
                              )
                            ],
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
                                        TableRow(children: [
                                          Text(
                                              '${controller.tempat['tempat_jam_operasional'][index]['hari']}'),
                                          Text(
                                            '${controller.tempat['tempat_jam_operasional'][index]['jam_buka']}',
                                            textAlign: TextAlign.end,
                                          ),
                                          Center(child: Text('-')),
                                          Text(
                                            '${controller.tempat['tempat_jam_operasional'][index]['jam_tutup']}',
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            '(${controller.tempat['tempat_jam_operasional'][index]['buka'] == 1 ? 'buka' : 'tutup'})',
                                            style: TextStyle(
                                                color: controller.tempat[
                                                                'tempat_jam_operasional']
                                                            [index]['buka'] ==
                                                        1
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                        ])
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Fasilitas',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      '/tempat/tempat-detail/tempat-fasilitas/${controller.id}');
                                },
                                child: Container(
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: Icon(
                                    Icons.edit,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: controller
                                      .tempat['tempat_fasilitas'].length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Text('- '),
                                        Text(
                                            '${controller.tempat['tempat_fasilitas'][index]['fasilitas']['nama']}'),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Olahraga & Harga',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      '/tempat/tempat-detail/tempat-olahraga/${controller.id}');
                                },
                                child: Container(
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: Icon(
                                    Icons.edit,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: controller
                                      .tempat['tempat_olahraga'].length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Text('- '),
                                        Text(
                                            '${controller.tempat['tempat_olahraga'][index]['olahraga']['nama']}'),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Lapangan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Get.toNamed(
                                      '/lapangan-buat/${controller.id}');
                                },
                                child: Container(
                                    // color: Colors.red,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    child: Text('Tambah')),
                              )
                            ],
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          'Tersedia ${controller.tempat['lapangan'].length} Lapangan'),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: controller.tempat['lapangan'].length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      '/tempat/tempat-detail/${controller.tempat['id']}/lapangan-detail/${controller.tempat['lapangan'][index]['id']}');
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 1),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.tempat['lapangan'][index]
                                                ['isaktif'] ==
                                            1
                                        ? Tema.color500
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: controller.tempat['lapangan']
                                                    [index]['img'] ==
                                                null
                                            ? Image.asset(
                                                'assets/image-not-found.jpg',
                                                width: 75,
                                                height: 75,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                '${Api.urlImg + controller.tempat['lapangan'][index]['img']}',
                                                width: 75,
                                                height: 75,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${controller.tempat['lapangan'][index]['nama']}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${controller.tempat['lapangan'][index]['tempat_olahraga']['olahraga']['nama']}',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                      Text(
                                                        'Tipe : ${controller.tempat['lapangan'][index]['tipe_lapangan'] != null ? controller.tempat['lapangan'][index]['tipe_lapangan']['nama'] : '-'}',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Alas : ${controller.tempat['lapangan'][index]['alas_lapangan'] != null ? controller.tempat['lapangan'][index]['alas_lapangan']['nama'] : '-'}',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Container(
                                                  //   // color: Colors.red,
                                                  //   height: 35,
                                                  //   child: Switch(
                                                  //     activeColor:
                                                  //         Tema.color600,
                                                  //     value: controller.tempat[
                                                  //                         'lapangan']
                                                  //                     [index]
                                                  //                 ['isaktif'] ==
                                                  //             1
                                                  //         ? true
                                                  //         : false,
                                                  //     onChanged: (value) {
                                                  //       controller.updateIsaktifLapangan(
                                                  //           controller.tempat[
                                                  //                   'lapangan']
                                                  //               [index]['id']);
                                                  //     },
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
