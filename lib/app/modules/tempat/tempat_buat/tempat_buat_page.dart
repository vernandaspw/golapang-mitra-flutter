import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tempat_buat_controller.dart';

class TempatBuatPage extends GetView<TempatBuatController> {
  const TempatBuatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TempatBuatPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TempatBuatPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
