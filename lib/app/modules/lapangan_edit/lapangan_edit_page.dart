import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'lapangan_edit_controller.dart';

class LapanganEditPage extends GetView<LapanganEditController> {
  const LapanganEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lapangan Edit'),
        centerTitle: true,
        backgroundColor: Tema.color500,
      ),
      body: Obx(
        () => SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getLapangan();
              controller.getTempatOlahraga();
              controller.getTipeLapangan();
              controller.getAlasLapangan();
            },
            child: controller.loadingLapangan == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Nama Lapangan'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller.namaC,
                          keyboardType: TextInputType.name,
                          maxLength: 20,
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
                            hintText: 'Nama Lapangan',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownSearch<dynamic>(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Pilih olahraga ",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          items: controller.tempatOlahragas,
                          popupProps: PopupProps.dialog(
                            title: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Pilih olahraga'),
                            ),
                            showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return ListTile(
                                textColor: Colors.black,
                                title: Text('${item['olahraga']['nama']}'),
                              );
                            },
                            // disabledItemFn: (String s) => s.startsWith('Pilih'),
                          ),
                          dropdownBuilder: (context, selectedItem) {
                            return Text(
                                selectedItem?['olahraga']['nama'].toString() ??
                                    '${controller.tempat_olahraga_nama}');
                          },
                          onChanged: (value) {
                            controller.tempat_olahraga_id.value =
                                value['id'].toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownSearch<dynamic>(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Pilih tipe lapangan ",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          items: controller.tipeLapangans,
                          popupProps: PopupProps.dialog(
                            title: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Pilih Tipe Lapangan'),
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
                            return Text(selectedItem?['nama'].toString() ??
                                '${controller.tipe_lapangan_nama}');
                          },
                          onChanged: (value) {
                            controller.tipe_lapangan_id.value =
                                value['id'].toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownSearch<dynamic>(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Pilih alas lapangan ",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          items: controller.alasLapangans,
                          popupProps: PopupProps.dialog(
                            title: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Pilih Alas Lapangan'),
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
                            return Text(selectedItem?['nama'].toString() ??
                                '${controller.alas_lapangan_nama}');
                          },
                          onChanged: (value) {
                            controller.alas_lapangan_id.value =
                                value['id'].toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Text('Status '),
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.isaktif.value == true) {
                                  controller.isaktif.value = false;
                                } else {
                                  controller.isaktif.value = true;
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: 80,
                                decoration: BoxDecoration(
                                  color: controller.isaktif == true
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(
                                    3,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.isaktif == true ? 'buka' : 'tutup'}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.simpanLapangan();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Tema.color500,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
