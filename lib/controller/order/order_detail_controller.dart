import 'dart:convert';

import 'package:apps_food/controller/food_controller.dart';
import 'package:apps_food/controller/global_controller.dart';
import 'package:apps_food/service/food_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:apps_food/utils/widget/text_label.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:apps_food/views/order/order_main_view.dart';

class OrderDetailController extends GetxController {
  var showLineMenu = false.obs;
  var username = "".obs;
  var emailUser = "".obs;
  var catatanCtr = TextEditingController();
  var absenType = 0.obs;
  var indexBanner = 0.obs;
  var heightPageView = 0.0.obs;

  var isActiveFilterChart = false.obs;

  var isStatusProses = false;

  var lismakananarekomen = [].obs;

  var tahun = DateTime.now().year.toString().obs;
  var bulan = DateTime.now().month.toString().padLeft(2, '0').obs;

  var bulanString = "${DateFormat('MMMM').format(DateTime.now())}".obs;
  var isLoadingGrafik = true.obs;
  var isLoadingTopBrand = true.obs;
  RxInt llimitSales = 10.obs;

  final FoodController foodController = Get.put(FoodController());
  final GlobalController globalController = Get.put(GlobalController());

  @override
  void onInit() {
    super.onInit();

    globalController.getUserLocation();
    // getMenuRekomen();
  }

  void routeMenu(menu) {
    Get.back();
    if (menu == "Order") {
      Get.to(OrderMainView());
    }
  }

 
  
  }
