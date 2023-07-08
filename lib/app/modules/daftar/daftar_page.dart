import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'daftar_controller.dart';

class DaftarPage extends GetView<DaftarController> {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('DaftarMasukPage'),
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      // ),
      backgroundColor: Colors.green,
      body: Obx(
        () => SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/logo/gl-cover-bg-none.png',
                          width: 250,
                          // height: 300,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Daftar untuk membuat akun mitra',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Tema.color600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.namaPenggunaC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.nama_pengguna.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Nama pengguna',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.phoneC,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            controller.phone.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Phone',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.emailC,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Email',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.passC,
                          obscureText: controller.hidden.isFalse,
                          onChanged: (value) {
                            controller.password.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePassword,
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidden.toggle(),
                              icon: controller.hidden.isTrue
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.remove_red_eye_outlined),
                            ),
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Password',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Nama mitra'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.namaMitraC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.nama_mitra.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: '(Futsal Star)',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Nama tempat olahraga'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.namaTempatC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.nama_tempat.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            prefixIcon: const Icon(
                              Icons.location_city,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: '(Futsal star area sukabangun)',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Deskripsi tempat olahraga'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.deskripsiTempatC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.deskripsi_tempat.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            prefixIcon: const Icon(
                              Icons.text_format_outlined,
                              color: Colors.black,
                            ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Deskripsi tempat',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 15),
                      //   child: Text('Pilih provinsi'),
                      // ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Alamat tempat olahraga',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Tema.color600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownSearch<dynamic>(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Pilih Provinsi",
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
                            return Text(
                                selectedItem?['nama'].toString() ?? 'Pilih');
                          },
                          onChanged: (value) {
                            controller.provinsi_id.value =
                                value['id'].toString();
                            controller.getKota(value['id']);
                          },
                        ),
                      ),
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownSearch<dynamic>(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Pilih kota",
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
                              child: Text('Pilih kota'),
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
                                '${controller.provinsi_id.isEmpty ? 'Belum pilih provinsi' : 'Belum pilih kota'}');
                          },
                          onChanged: (value) {
                            controller.kota_id.value = value['id'].toString();
                            controller.getKota(value['id']);
                          },
                        ),
                      ),
                      Tema.enter8,
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Kecamatan'),
                      ),
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.kecamatanC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.kecamatan.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            // prefixIcon: const Icon(
                            //   Icons.person,
                            //   color: Colors.black,
                            // ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
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
                      Tema.enter8,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Alamat'),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.alamatC,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.alamat.value = value;
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.red),
                            ),
                            errorText: controller.validatePhone,
                            // prefixIcon: const Icon(
                            //   Icons.location_on,
                            //   color: Colors.black,
                            // ),
                            fillColor: Tema.color400,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Alamat',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Tema.enter8,
                      Tema.enter8,
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.daftar();
                          },
                          child: Text('Daftar'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.maxFinite, 0),
                            primary: Tema.color600,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // Center(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Get.toNamed('/lupa-password');
                      //     },
                      //     child: Text(
                      //       'Lupa password?',
                      //       style: TextStyle(fontWeight: FontWeight.w400),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah memiliki akun? ',
                              style: TextStyle(
                                color: Tema.color800,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offNamed('/masuk');
                              },
                              child: Text(
                                'Masuk',
                                style: TextStyle(
                                    color: Tema.color500,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
