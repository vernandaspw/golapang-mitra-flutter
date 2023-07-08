import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'tempat_olahraga_baru_controller.dart';

class TempatOlahragaBaruPage extends GetView<TempatOlahragaBaruController> {
  const TempatOlahragaBaruPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tempat Olahraga Baru'),
          centerTitle: true,
          backgroundColor: Tema.color500,
        ),
        body: Obx(
          () => controller.loadingTempat == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownSearch<dynamic>(
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Tambah Olahraga ",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        items: controller.olahragas,
                        popupProps: PopupProps.dialog(
                          title: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Pilih Olahraga'),
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
                          controller.olahraga_id.value = value['id'].toString();
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
                          Text('Harga lapangan '),
                          Text(
                            '*Semua hari & jam',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: controller.hargaC,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          controller.harga.value = value;
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
                          hintText: 'Harga Lapangan',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '*Harga per hari/jam bisa diubah di bawah',
                        style: TextStyle(fontSize: 13, color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          controller.simpanOlahraga();
                        },
                        child: Container(
                          color: Tema.color500,
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text('Simpan Olahraga',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Divider(thickness: 4),
                  ],
                ),
        ));
  }
}
