import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'iklan_controller.dart';

class IklanPage extends GetView<IklanController> {
  const IklanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iklan'),
        centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: const Center(
        child: Text(
          'Comming Soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
