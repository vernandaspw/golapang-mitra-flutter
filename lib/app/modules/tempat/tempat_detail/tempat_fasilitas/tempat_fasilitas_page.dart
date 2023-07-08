import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'tempat_fasilitas_controller.dart';

class TempatFasilitasPage extends GetView<TempatFasilitasController> {
  const TempatFasilitasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tersedia Fasilitas'),
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
              controller.getFasilitas();
            },
            child: controller.loadingTempat == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownSearch<dynamic>(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Tambah Fasilitas ",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          items: controller.fasilitas,
                          popupProps: PopupProps.dialog(
                            title: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Pilih Fasilitas'),
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
                            controller.fasilitas_id.value =
                                value['id'].toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            controller.simpanFasilitas();
                          },
                          child: Container(
                            color: Tema.color400,
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text('Tambah Fasilitas'),
                            ),
                          ),
                        ),
                      ),
                      Divider(thickness: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Fasilitas yg tersedia ditempat ini'),
                      ),
                      // Text(controller.tempat['tempat_fasilitas'].length.toString())

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              controller.tempat['tempat_fasilitas'].length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 3),
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      controller.tempat['tempat_fasilitas']
                                                  [index]['fasilitas']['img'] !=
                                              null
                                          ? Image.network(
                                              '${Api.urlImg + controller.tempat['tempat_fasilitas'][index]['fasilitas']['img']}',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/image-not-found.jpg'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${controller.tempat['tempat_fasilitas'][index]['fasilitas']['nama']}'),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: 'Yakin mau hapus?',
                                        titleStyle:
                                            TextStyle(color: Colors.red),
                                        middleText:
                                            'menghapus fasilitas ditempat ini',
                                        textConfirm: 'Oke',
                                        textCancel: 'Batal',
                                        onConfirm: () async {
                                          controller.hapusFasilitas(controller
                                                  .tempat['tempat_fasilitas']
                                              [index]['id']);
                                          Get.back();
                                        },
                                        buttonColor: Colors.red,
                                        confirmTextColor: Colors.white,
                                        cancelTextColor: Colors.green,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          child: Text(
                                        'Hapus',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
