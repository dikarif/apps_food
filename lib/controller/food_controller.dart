import 'package:flutter/material.dart';
import 'package:apps_food/models/food_models.dart';
import 'package:get/state_manager.dart';

class FoodController extends GetxController {
  var listmakanan = <FoodModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDataDummy();
  }

  void loadDataDummy() {
    listmakanan.assignAll([
      FoodModel(
        nama: "Burger Sapi",
        gambar:
            "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=200&q=80",
        harga: 35000,
        rating: 4.8,
      ),
      FoodModel(
        nama: "Ayam Penyet",
        gambar:
            "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=200&q=80",
        harga: 20000,
        rating: 4.5,
      ),
    ]);
  }
}
