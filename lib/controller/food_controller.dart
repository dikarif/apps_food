import 'package:apps_food/models/food_models.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:apps_food/service/food_service.dart';
import 'package:flutter/material.dart';

class FoodController extends GetxController {
  // var listmakanan = <FoodModel>[].obs;
  var listmakanan = [].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // loadDataDummy();
    getMenu();
  }

  void getMenu() async {
    try {
      isLoading(true);
      var data = await FoodService().getMenu();
      listmakanan.assignAll(data);
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
  //   listmakanan.assignAll([
  //     FoodModel(
  //       nama: "Burger Sapi",
  //       harga: 35000,
  //       rating: 4.8,
  //       gambar: 'assets/burger.jpg',
  //     ),
  //     FoodModel(
  //       nama: "Ayam Penyet",
  //       harga: 20000,
  //       rating: 4.5,
  //       gambar: 'assets/ayam.jpg',
  //     ),
  //     FoodModel(
  //       nama: "Pizza",
  //       harga: 60000,
  //       rating: 4.5,
  //       gambar: 'assets/pizza.jpg',
  //     ),
  //     FoodModel(
  //       nama: "Mie Goreng",
  //       harga: 20000,
  //       rating: 4.5,
  //       gambar: 'assets/mie.jpg',
  //     ),
  //     FoodModel(
  //       nama: "Siomay",
  //       harga: 10000,
  //       rating: 4.5,
  //       gambar: 'assets/siomay.jpg',
  //     ),
  //   ]);

  //   lismakananarekomen.assignAll([
  //     FoodModelRekomen(
  //       namarekomen: "Burger Sapi",
  //       hargarekomen: 35000,
  //       ratingrekomen: 4.8,
  //       gambarRekomen: 'assets/burger.jpg',
  //     ),
  //     FoodModelRekomen(
  //       namarekomen: "Ayam Penyet",
  //       hargarekomen: 20000,
  //       ratingrekomen: 4.5,
  //       gambarRekomen: 'assets/ayam.jpg',
  //     ),
  //     FoodModelRekomen(
  //       namarekomen: "Pizza",
  //       hargarekomen: 60000,
  //       ratingrekomen: 4.5,
  //       gambarRekomen: 'assets/pizza.jpg',
  //     ),
  //     FoodModelRekomen(
  //       namarekomen: "Mie Goreng",
  //       hargarekomen: 20000,
  //       ratingrekomen: 4.5,
  //       gambarRekomen: 'assets/mie.jpg',
  //     ),
  //     FoodModelRekomen(
  //       namarekomen: "Siomay",
  //       hargarekomen: 10000,
  //       ratingrekomen: 4.5,
  //       gambarRekomen: 'assets/siomay.jpg',
  //     ),
  //   ]);
  // }
}
