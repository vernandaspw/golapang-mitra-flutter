import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/core/theme/tema.dart';

import 'start_screen_controller.dart';

class StartScreenPage extends GetView<StartScreenController> {
  const StartScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/logo/gl-bg-none.png',
                  width: 200,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'versi 1.0.0',
                style: TextStyle(
                  fontSize: 15,
                  color: Tema.color700,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
