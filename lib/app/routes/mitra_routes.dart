import 'package:get/get.dart';

import '../modules/mitra/mitra_binding.dart';
import '../modules/mitra/mitra_page.dart';
import '../modules/mitra/mitra_edit/mitra_edit_binding.dart';
import '../modules/mitra/mitra_edit/mitra_edit_page.dart';

class MitraRoutes {
  MitraRoutes._();

  static const mitra = '/mitra';
	static const mitraEdit = '/mitra/mitra-edit';

  static final routes = [
    GetPage(
      name: mitra,
      page: () => const MitraPage(),
      binding: MitraBinding(),
    ),
		GetPage(
      name: mitraEdit,
      page: () => const MitraEditPage(),
      binding: MitraEditBinding(),
    ),
  ];
}
