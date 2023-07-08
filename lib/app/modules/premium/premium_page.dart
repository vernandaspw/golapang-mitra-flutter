import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'premium_controller.dart';

class PremiumPage extends GetView<PremiumController> {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium Page'),
        centerTitle: true,
        backgroundColor: Tema.color600,
      ),
      body: const Center(
        child: Text(
          'coming soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
