import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:apps_food/toast.dart';

class DashboardController extends GetxController {
  var tabIndex = 0.obs; // 0 = Home, 1 = Cart, 2 = History, 3 = Profile
  Rx<PersistentTabController> tabPersistantController =
      PersistentTabController().obs;
  DateTime? _currentBackPressTime;

  var kontrolAkses = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      UtilsAlert.showToast("Tekan sekali lagi untuk keluar");
      return Future.value(false);
    }
    return Future.value(true);
  }

  void onClickItem(s) async {
    print(s);
    if (s == 0) {
      // try {
      // var dashboardController = Get.find<DashboardController>();
      // // dashboardController.onClose();
      // dashboardController.onInit();
      // } catch (e) {}
    } else if (s == 1) {
      // try {
      //   // var aktifitasController = Get.find<AktifitasController>();
      //   // aktifitasController.onInit();
      // } catch (e) {}
    } else if (s == 2) {
      // try {
      //   // var pesanController = Get.find<PesanController>();
      //   // pesanController.onInit();
      // } catch (e) {}
    }
  }
}
