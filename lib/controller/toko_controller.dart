import 'package:apps_food/models/food_models.dart';
import 'package:apps_food/models/toko_models.dart';
import 'package:apps_food/service/toko_service.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PenjualController extends GetxController {
  var listtoko = <TokoModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // loadDataDummy();
    getToko();
  }

  void getToko() async {
    try {
      isLoading(true);
      print('ini listokot ${listtoko}');
      var data = await TokoService().getToko();
      listtoko.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Tidak dapat mengambil data: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  // void loadDataDummy() {
  //   listtoko.assignAll([
  //     TokoModel(
  //       toko: "Warung Bahari",
  //       alamat: 'Jln. Adem Sari',
  //       nama: 'Wahyuni',
  //       gambar: 'assets/toko1.jpg',
  //     ),
  //     TokoModel(
  //       toko: "RM.Padang",
  //       alamat: 'Jln. Buntu',
  //       nama: 'Udak wahyu',
  //       gambar: 'assets/toko2.jpg',
  //     ),
  //     TokoModel(
  //       toko: "Pagi Sore",
  //       alamat: 'Jln. Terdekat',
  //       nama: 'Si Halland',
  //       gambar: 'assets/toko3.jpg',
  //     ),
  //     TokoModel(
  //       toko: "Mas Marno",
  //       alamat: 'Jln. RSUD',
  //       nama: 'marno',
  //       gambar: 'assets/toko4.jpg',
  //     ),
  //     TokoModel(
  //       toko: "Ayam Lonkouas",
  //       alamat: 'Samping RSUD',
  //       nama: 'Wahyuni',
  //       gambar: 'assets/toko5.jpg',
  //     ),
  //   ]);
  // }
}
