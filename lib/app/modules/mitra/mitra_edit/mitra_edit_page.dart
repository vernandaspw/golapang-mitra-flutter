import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/config/api.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';
import 'package:image_picker/image_picker.dart';

import 'mitra_edit_controller.dart';

class MitraEditPage extends GetView<MitraEditController> {
  const MitraEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit mitra'),
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
              controller.getMe();
            },
            child: controller.loadingMe == true
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
                        child: Text('Nama mitra'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller.namaC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.nama.value = value;
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
                            hintText: 'Nama mitra',
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
                        child: Text('Deskripsi'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller.deskripsiC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.deskripsi.value = value;
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
                            hintText: 'Deskripsi',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
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
