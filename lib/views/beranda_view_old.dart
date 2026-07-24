import 'package:flutter/material.dart';
import 'package:apps_food/models/food_models.dart';
import 'package:apps_food/controller/food_controller.dart';
import 'package:apps_food/controller/global_controller.dart';
import 'package:get/get.dart';

class BerandaView extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());
  // final GlobalController globalC = Get.find<GlobalController>();
  final globalC = Get.put(GlobalController());

  BerandaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Food Delivery 🍔",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.grey[100],
      body: Obx(() {
        if (foodController.listmakanan.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: foodController.listmakanan.length,
          itemBuilder: (context, index) {
            var menu = foodController.listmakanan[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    menu.gambar,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  menu.nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Rp ${globalC.FormatNumber_(menu.harga.toInt())}\n⭐ ${menu.rating}",
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.snackbar(
                      "Masuk Keranjang 🛒",
                      "${menu.nama} berhasil ditambahkan!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  },
                  child: const Text(
                    "Beli",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
