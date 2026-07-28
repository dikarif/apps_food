import 'package:flutter/material.dart';
import 'package:apps_food/models/food_models.dart';
import 'package:get/state_manager.dart';

class FoodController extends GetxController {
  var listmakanan = <FoodModel>[].obs;
  var lismakananarekomen = <FoodModelRekomen>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDataDummy();
  }

  void loadDataDummy() {
    listmakanan.assignAll([
      FoodModel(nama: "Burger Sapi", harga: 35000, rating: 4.8, gambar: ""),
      FoodModel(nama: "Ayam Penyet", harga: 20000, rating: 4.5, gambar: ""),
    ]);

    lismakananarekomen.assignAll([
      FoodModelRekomen(
        namarekomen: "Burger Sapi",
        hargarekomen: 35000,
        ratingrekomen: 4.8,
        gambarRekomen: 'assets/burger.jpg',
      ),
      FoodModelRekomen(
        namarekomen: "Ayam Penyet",
        hargarekomen: 20000,
        ratingrekomen: 4.5,
        gambarRekomen: 'assets/ayam.jpg',
      ),
      FoodModelRekomen(
        namarekomen: "Pizza",
        hargarekomen: 60000,
        ratingrekomen: 4.5,
        gambarRekomen: 'assets/pizza.jpg',
      ),
      FoodModelRekomen(
        namarekomen: "Mie Goreng",
        hargarekomen: 20000,
        ratingrekomen: 4.5,
        gambarRekomen: 'assets/mie.jpg',
      ),
      FoodModelRekomen(
        namarekomen: "Siomay",
        hargarekomen: 10000,
        ratingrekomen: 4.5,
        gambarRekomen: 'assets/siomay.jpg',
      ),
    ]);
  }
}
