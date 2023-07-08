import 'home_routes.dart';
import 'daftar_masuk_routes.dart';
import 'daftar_routes.dart';
import 'masuk_routes.dart';
import 'akun_routes.dart';
import 'karyawan_routes.dart';
import 'iklan_routes.dart';
import 'mitra_routes.dart';
import 'tempat_routes.dart';
import 'start_screen_routes.dart';
import 'auth_otp_routes.dart';
import 'lupa_password_routes.dart';
import 'premium_routes.dart';
import 'lapangan_buat_routes.dart';
import 'tempat_olahraga_baru_routes.dart';
import 'lapangan_edit_routes.dart';
import 'dompet_topup_routes.dart';
import 'dompet_riwayat_routes.dart';
import 'dompet_kredit_riwayat_routes.dart';
import 'dompet_kredit_topup_routes.dart';
import 'dompet_tarik_routes.dart';
import 'dompet_detail_routes.dart';
import 'dompet_kredit_detail_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/start-screen';

  static final routes = [
    ...HomeRoutes.routes,
    ...DaftarMasukRoutes.routes,
    ...DaftarRoutes.routes,
    ...MasukRoutes.routes,
    ...AkunRoutes.routes,
    ...KaryawanRoutes.routes,
    ...IklanRoutes.routes,
    ...MitraRoutes.routes,
    ...TempatRoutes.routes,
    ...StartScreenRoutes.routes,
    ...AuthOtpRoutes.routes,
		...LupaPasswordRoutes.routes,
		...PremiumRoutes.routes,
		...LapanganBuatRoutes.routes,
		...TempatOlahragaBaruRoutes.routes,
		...LapanganEditRoutes.routes,
		...DompetTopupRoutes.routes,
		...DompetRiwayatRoutes.routes,
		...DompetKreditRiwayatRoutes.routes,
		...DompetKreditTopupRoutes.routes,
		...DompetTarikRoutes.routes,
		...DompetDetailRoutes.routes,
		...DompetKreditDetailRoutes.routes,
  ];
}
