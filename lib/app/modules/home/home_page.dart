import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/helpers/FormatUang.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tema.color600,
      appBar: AppBar(
        title: Image.asset('assets/logo/gl-cover-bg-none.png', width: 100),
        backgroundColor: Colors.white,
        actions: [
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     margin: EdgeInsets.symmetric(vertical: 11),
          //     padding: EdgeInsets.all(5),
          //     decoration: BoxDecoration(
          //       color: Tema.color700,
          //       borderRadius: BorderRadius.circular(6),
          //     ),
          //     child: Center(
          //       child: Text('Tempat/Cabang'),
          //     ),
          //   ),
          // ),
          SizedBox(
            width: 8,
          ),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 1),
            child: CircleAvatar(
              backgroundColor: Tema.color600,
              radius: 22,
              child: InkWell(
                onTap: () {
                  Get.toNamed('/akun');
                },
                child: CircleAvatar(
                  radius: 19,
                  backgroundImage: AssetImage('assets/logo/gl-bg-white.jpg'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            Dashboard(),
            Pesanan(),
            PesananMember(),
            // Laporan(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTabIndex,
          unselectedItemColor: Colors.black45,
          showSelectedLabels: true,
          // showUnselectedLabels: true,
          selectedItemColor: Tema.color500,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Pesanan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership),
              label: 'Pesanan Member',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.bar_chart),
            //   label: 'Laporan',
            // ),
          ],
        ),
      ),
    );
  }
}

class Dashboard extends GetView<HomeController> {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
          onRefresh: () async {
            controller.getMe();
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Hi, ${controller.namaMitra}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 3),
                        blurRadius: 10,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Saldo',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                controller.me['mitra'] == null
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        '${FormatUang.keIdr(double.parse(controller.me['mitra']['saldo']), 0)}',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Tema.color600,
                                        ),
                                      ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/dompet-topup');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Tema.color500,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.file_download_outlined,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            Text(
                                              'Top Up',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/dompet-tarik');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 11, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Tema.color500,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.file_upload_outlined,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            Text(
                                              ' Tarik ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/dompet-riwayat');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Tema.color500,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.av_timer,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            Text(
                                              'Riwayat',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 3),
                        blurRadius: 10,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Saldo Kredit',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                controller.me['mitra'] == null
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        '${FormatUang.keIdr(double.parse(controller.me['mitra']['saldo_kredit']), 0)}',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Tema.color600,
                                        ),
                                      ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/dompet-kredit-topup');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Tema.color500,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.add_circle_outline_sharp,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            Text(
                                              'Isi saldo',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/dompet-kredit-riwayat');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Tema.color500,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.av_timer,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            Text(
                                              'Riwayat',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 3),
                        blurRadius: 10,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Pendapatan bulan ini',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            // Text('200 Pesanan'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${FormatUang.keIdr(200000, 0)}',
                              style: TextStyle(
                                  // color: Colors.black45,
                                  ),
                            ),
                            Text('200 Pesanan'),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 3),
                        blurRadius: 10,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Pendapatan hari ini',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            // Text('200 Pesanan'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${FormatUang.keIdr(200000, 0)}',
                              style: TextStyle(
                                  // color: Colors.black45,
                                  ),
                            ),
                            Text('200 Pesanan'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('23'),
                                Text('order diaplikasi'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('23'),
                                Text('order ditempat'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/mitra');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              // width: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Mitra',
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/tempat');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              // width: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Tempat',
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/karyawan');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              // width: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Karyawan',
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),

                        // Expanded(
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(
                        //         5,
                        //       ),
                        //     ),
                        //     padding: EdgeInsets.symmetric(vertical: 10),
                        //     // width: MediaQuery.of(context).size.width / 3.1,
                        //     child: Center(
                        //       child: Column(
                        //         children: [
                        //           Text(
                        //             'Karyawan',
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/iklan');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              // width: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Iklan',
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            // width: MediaQuery.of(context).size.width / 3,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    '',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            // width: MediaQuery.of(context).size.width / 3,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    '',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class Pesanan extends GetView<HomeController> {
  const Pesanan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data'),
    );
  }
}

class PesananMember extends GetView<HomeController> {
  const PesananMember({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {}, child: Text('pesanan member'));
  }
}

// class Laporan extends GetView<HomeController> {
//   const Laporan({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(onTap: () {}, child: Text('Laporan'));
//   }
// }
