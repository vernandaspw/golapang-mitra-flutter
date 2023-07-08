import 'package:get/get.dart';

import '../modules/tempat/tempat_binding.dart';
import '../modules/tempat/tempat_page.dart';
import '../modules/tempat/tempat_detail/tempat_detail_binding.dart';
import '../modules/tempat/tempat_detail/tempat_detail_page.dart';
import '../modules/tempat/tempat_buat/tempat_buat_binding.dart';
import '../modules/tempat/tempat_buat/tempat_buat_page.dart';
import '../modules/tempat/tempat_detail/tempat_edit/tempat_edit_binding.dart';
import '../modules/tempat/tempat_detail/tempat_edit/tempat_edit_page.dart';
import '../modules/tempat/tempat_detail/tempat_foto/tempat_foto_binding.dart';
import '../modules/tempat/tempat_detail/tempat_foto/tempat_foto_page.dart';
import '../modules/tempat/tempat_detail/tempat_alamat/tempat_alamat_binding.dart';
import '../modules/tempat/tempat_detail/tempat_alamat/tempat_alamat_page.dart';
import '../modules/tempat/tempat_detail/tempat_jam_operasional/tempat_jam_operasional_binding.dart';
import '../modules/tempat/tempat_detail/tempat_jam_operasional/tempat_jam_operasional_page.dart';
import '../modules/tempat/tempat_detail/tempat_olahraga/tempat_olahraga_binding.dart';
import '../modules/tempat/tempat_detail/tempat_olahraga/tempat_olahraga_page.dart';
import '../modules/tempat/tempat_detail/tempat_fasilitas/tempat_fasilitas_binding.dart';
import '../modules/tempat/tempat_detail/tempat_fasilitas/tempat_fasilitas_page.dart';
import '../modules/tempat/tempat_detail/lapangan_detail/lapangan_detail_binding.dart';
import '../modules/tempat/tempat_detail/lapangan_detail/lapangan_detail_page.dart';

class TempatRoutes {
  TempatRoutes._();

  static const tempat = '/tempat';
  static const tempatDetail = '/tempat/tempat-detail/:id';
  static const tempatBuat = '/tempat/tempat-buat';
  static const tempatEdit = '/tempat/tempat-detail/tempat-edit/:id';
  static const tempatFoto = '/tempat/tempat-detail/tempat-foto/:id';
  static const tempatAlamat = '/tempat/tempat-detail/tempat-alamat/:id';
  static const tempatJamOperasional =
      '/tempat/tempat-detail/tempat-jam-operasional/:id';
  static const tempatOlahraga = '/tempat/tempat-detail/tempat-olahraga/:id';
  static const tempatFasilitas = '/tempat/tempat-detail/tempat-fasilitas/:id';

  static const lapanganDetail =
      '/tempat/tempat-detail/:tempat_id/lapangan-detail/:lapangan_id';

  static final routes = [
    GetPage(
      name: tempat,
      page: () => const TempatPage(),
      binding: TempatBinding(),
    ),
    GetPage(
      name: tempatDetail,
      page: () => const TempatDetailPage(),
      binding: TempatDetailBinding(),
    ),
    GetPage(
      name: tempatBuat,
      page: () => const TempatBuatPage(),
      binding: TempatBuatBinding(),
    ),
    GetPage(
      name: tempatEdit,
      page: () => const TempatEditPage(),
      binding: TempatEditBinding(),
    ),
    GetPage(
      name: tempatFoto,
      page: () => const TempatFotoPage(),
      binding: TempatFotoBinding(),
    ),
    GetPage(
      name: tempatAlamat,
      page: () => const TempatAlamatPage(),
      binding: TempatAlamatBinding(),
    ),
    GetPage(
      name: tempatJamOperasional,
      page: () => const TempatJamOperasionalPage(),
      binding: TempatJamOperasionalBinding(),
    ),
    GetPage(
      name: tempatOlahraga,
      page: () => const TempatOlahragaPage(),
      binding: TempatOlahragaBinding(),
    ),
    GetPage(
      name: tempatFasilitas,
      page: () => const TempatFasilitasPage(),
      binding: TempatFasilitasBinding(),
    ),
    GetPage(
      name: lapanganDetail,
      page: () => const LapanganDetailPage(),
      binding: LapanganDetailBinding(),
    ),
  ];
}
