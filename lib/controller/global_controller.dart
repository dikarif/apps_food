import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class GlobalController extends GetxController {
  var userLat = 0.0.obs;
  var userLong = 0.0.obs;

  var isLocationReady = false.obs;

  Future<void> getUserLocation() async {
    print('masul lokasi');
    bool serviceEnabled;
    LocationPermission permission;

    print('lokasi ${isLocationReady}');

    // Cek apakah GPS HP menyala
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        'Informasi',
        'Harap aktifkan GPS HP Anda untuk melihat jarak toko.',
      );
      return;
    }

    // Cek apakah aplikasi sudah diizinkan membaca GPS
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Jika belum, munculkan pop-up permintaan izin ke user
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Jika user menekan "Tolak"
        Get.snackbar(
          'Izin Ditolak',
          'Aplikasi tidak bisa menghitung jarak tanpa akses lokasi.',
        );
        return;
      }
    }

    // Jika user menekan "Tolak Permanen"
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Akses Terkunci',
        'Silakan buka pengaturan aplikasi di HP untuk mengizinkan lokasi.',
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    userLat.value = position.latitude;
    userLong.value = position.longitude;
    isLocationReady.value = true;

    print('GPS Berhasil Didapat: Lat ${userLat.value}, Long ${userLong.value}');
  }

  String FormatNumber_(num Nilai) {
    var formatter = NumberFormat('#,##,000');
    return (formatter.format(Nilai));
  }
}
