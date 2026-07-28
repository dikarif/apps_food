import 'package:apps_food/models/food_models.dart';
import 'package:apps_food/models/penjual_models.dart';
import 'package:get/state_manager.dart';

class PenjualController extends GetxController {
  var listtoko = <PenjualModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDataDummy();
  }

  void loadDataDummy() {
    listtoko.assignAll([
      PenjualModel(
        toko: "Warung Bahari",
        alamat: 'Jln. Adem Sari',
        nama: 'Wahyuni',
        gambar: 'assets/toko1.jpg',
      ),
      PenjualModel(
        toko: "RM.Padang",
        alamat: 'Jln. Buntu',
        nama: 'Udak wahyu',
        gambar: 'assets/toko2.jpg',
      ),
      PenjualModel(
        toko: "Pagi Sore",
        alamat: 'Jln. Terdekat',
        nama: 'Si Halland',
        gambar: 'assets/toko3.jpg',
      ),
      PenjualModel(
        toko: "Mas Marno",
        alamat: 'Jln. RSUD',
        nama: 'marno',
        gambar: 'assets/toko4.jpg',
      ),
      PenjualModel(
        toko: "Ayam Lonkouas",
        alamat: 'Samping RSUD',
        nama: 'Wahyuni',
        gambar: 'assets/toko5.jpg',
      ),
    ]);
  }
}
