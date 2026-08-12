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

class BerandaController extends GetxController {
  var showLineMenu = false.obs;
  var salesman = [].obs;
  var salesmanCode = "".obs;
  var salesManName = "".obs;
  var username = "".obs;
  var emailUser = "".obs;
  var kodeCabangSelected = "".obs;
  var namaCabangSelected = "".obs;
  var alamat1CabangSelected = "".obs;
  var periodeTerpilih = "".obs;
  var periodeDateSelected = DateTime.now().obs;
  var listCabang = [].obs;
  var catatanCtr = TextEditingController();
  var absenType = 0.obs;
  var targetSales = "0.0".obs;
  var penjualan = "0.0".obs;
  var penerimaan = "0.0".obs;
  var piutang = "0.0".obs;
  var totalGold = "0.0".obs;
  var totalSilver = "0.0".obs;
  var indexBanner = 0.obs;
  var heightPageView = 0.0.obs;

  var isActiveFilterChart = false.obs;
  var salesmanCodeDefault = "".obs;
  var salesManNameDefault = "".obs;
  var ulangtahun = [].obs;
  // var topBrand = <TopBrandModel>[].obs;
  // var targetSalesList = <GrafikDashboardModel>[].obs;
  // var TargetPenjualanLList = <GrafikDashboardModel>[].obs;
  // var targetPenerimaanList = <GrafikDashboardModel>[].obs;
  // var targetPiutangList = <GrafikDashboardModel>[].obs;
  var isStatusProses = false;

  var lismakananarekomen = [].obs;

  var menulaporan = [
    {"name": "Order Penjualan", "icon": "", 'page': ''},
    {"name": "Cek Stok", "icon": "", 'page': ''},
    {"name": "Cek Piutang", "icon": "", 'page': ''},
    {"name": "laporan Order", "icon": "", 'page': ''},
    {"name": "Laporan Pengiriman", "icon": "", 'page': ''},
    {"name": "laporan Penjualan", "icon": "", 'page': ''},
    {"name": "Laporan Sales Activity", "icon": "", 'page': ''},
    {"name": "Laporan Master Paket", "icon": "", 'page': ''},
    {"name": "Order Penjualan", "icon": "", 'page': ''},
    {"name": "Order Penjualan", "icon": "", 'page': ''},
  ];

  var keteranganUlangtahun = "".obs;

  // var authController=Get.put(AuthController());

  var tahun = DateTime.now().year.toString().obs;
  var bulan = DateTime.now().month.toString().padLeft(2, '0').obs;

  var bulanString = "${DateFormat('MMMM').format(DateTime.now())}".obs;
  var isLoadingGrafik = true.obs;
  var isLoadingTopBrand = true.obs;
  RxInt llimitSales = 10.obs;

  var dataColor = [
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.amber,
    Colors.blue,
  ];

  final List<String> listBanner = [
    'assets/mk_dashboard.png',
    'assets/mk_dashboard2.png',
  ];

  CarouselSliderController corouselBeranda = CarouselSliderController();
  PageController menuController = PageController(initialPage: 0);
  PageController informasiController = PageController(initialPage: 0);

  final FoodController foodController = Get.put(FoodController());
  final GlobalController globalController = Get.put(GlobalController());

  @override
  void onInit() {
    super.onInit();

    globalController.getUserLocation();
    getMenuRekomen();
  }

  void routeMenu(menu) {
    Get.back();
    if (menu == "Order") {
      Get.to(OrderMainView());
    }
  }

  void getMenuRekomen() async {
    try {
      // isLoading(true);
      var data = await FoodService().getMenuRekomen();
      lismakananarekomen.assignAll(data);
      print('lismakananarekomen ${lismakananarekomen}');
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Tidak dapat mengambil data: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    //  finally {
    //   isLoading(false);
    // }
  }
}
