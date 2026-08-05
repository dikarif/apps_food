import 'package:flutter/material.dart';
import 'package:apps_food/utils/utility.dart';
import 'package:apps_food/controller/food_controller.dart';
import 'package:get/get.dart';
import 'package:apps_food/models/food_models.dart';
import 'package:apps_food/controller/global_controller.dart';

class OrderMainView extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());
  final globalC = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utility.baseColor2,
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        // Mengatur Grid menjadi 2 kolom
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.65,
        ),
        itemCount: foodController.listmakanan.length,
        itemBuilder: (context, index) {
          return cardGridMenu(foodController.listmakanan[index]);
        },
      ),
    );
  }

  Widget cardGridMenu(FoodModel data) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          print("Menu diklik!");
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  data.gambar,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Ruang napas dalam card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Warteg Orens Bahari",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            "4.8",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.location_on,
                            size: 12,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 2),
                          Text(
                            "1.2 km",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),

                      Text(
                        "Rp ${globalC.FormatNumber_(data.harga.toInt())}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
