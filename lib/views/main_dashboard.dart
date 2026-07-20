import 'package:apps_food/controller/main_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:apps_food/views/beranda_view.dart';

class MainDashboard extends StatelessWidget {
  final DashboarController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: DashboarController.tabIndex.value,
          children: [
            BerandaView(),
            Center(child: Text("Keranjang")),
            Center(child: Text("Riwayat")),
            Center(child: Text("Akun")),
          ],
        ),
      ),
    );
  }
}
