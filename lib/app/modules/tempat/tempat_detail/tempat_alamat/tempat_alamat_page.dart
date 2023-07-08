import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'tempat_alamat_controller.dart';

class TempatAlamatPage extends GetView<TempatAlamatController> {
  const TempatAlamatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat Edit Alamat'),
        // centerTitle: true,
        backgroundColor: Tema.color600,
        actions: [
          InkWell(
            onTap: () {
              controller.simpan();
            },
            child: Container(
              // color: Tema.color400,
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text('Simpan'),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
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
                : ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownSearch<dynamic>(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Pilih Provinsi ",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          items: controller.provinsis,
                          popupProps: PopupProps.dialog(
                            title: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Pilih Provinsi'),
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
                                '${controller.provinsiNama}');
                          },
                          onChanged: (value) {
                            print(value);
                            controller.provinsi_id.value =
                                value['id'].toString();
                            controller.getKota(value['id']);
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
                              labelText: "Pilih kota/kabupaten",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          items: controller.kotas,
                          popupProps: PopupProps.dialog(
                            title: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Pilih kota/kabupaten'),
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
                                '${controller.provinsi_id.isEmpty ? 'Belum pilih provinsi' : '${controller.kotaNama}'}');
                          },
                          onChanged: (value) {
                            controller.kota_id.value = value['id'].toString();
                            controller.getKota(value['id']);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Kecamatan'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller.kecamatanC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.kecamatan.value = value;
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
                            hintText: 'Kecamatan',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Alamat lengkap'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller.alamatC,
                          keyboardType: TextInputType.streetAddress,
                          onChanged: (value) {
                            controller.alamat.value = value;
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
                            hintText: 'Alamat lengkap',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
