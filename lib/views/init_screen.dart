import 'package:apps_food/views/beranda_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:apps_food/controller/main_dashboard_controller.dart';
import 'package:apps_food/utility.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final controller = Get.put(DashboardController());

  List<Widget> _buildScreens() {
    return [
      BerandaView(),
      // SallesActivityPage(),
      // Profile(),
      Container(
        color: Colors.white,
        child: const Center(child: Text("Halaman Sales")), //sementara
      ),
      Container(
        color: Colors.white,
        child: const Center(child: Text("Halaman Profile")), //sementara
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.home_25),
        inactiveIcon: const Icon(Iconsax.home_24),
        // icon: ImageIcon(AssetImage("assets/beranda_fill.png")),
        // inactiveIcon: ImageIcon(AssetImage("assets/berandaa.png")),
        title: "Beranda",
        textStyle: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        activeColorPrimary: Utility.primaryDefault,
        inactiveColorPrimary: Utility.nonAktif,
        // activeColorSecondary: Utility.infoDark,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.activity5),
        inactiveIcon: const Icon(Iconsax.activity4),
        // icon: ImageIcon(AssetImage("assets/activity_fill.png")),
        // inactiveIcon: ImageIcon(AssetImage("assets/activity.png")),
        title: "Sales Activity",
        textStyle: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        activeColorPrimary: Utility.primaryDefault,
        inactiveColorPrimary: Utility.nonAktif,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.profile_circle5),
        inactiveIcon: const Icon(Iconsax.profile_circle4),
        // icon: ImageIcon(AssetImage("assets/profile_fill.png")),
        // inactiveIcon: ImageIcon(AssetImage("assets/profile.png")),
        title: "Profile",
        textStyle: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        activeColorPrimary: Utility.primaryDefault,
        inactiveColorPrimary: Utility.nonAktif,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PersistentTabView(
        // 1. 'context' sebagai argumen pertama sudah dihapus.
        context,
        controller: controller.tabPersistantController.value,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        onWillPop: (s) async => await controller.onWillPop(),
        onItemSelected: (s) => controller.onClickItem(s),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: 60.0,
        padding: EdgeInsets.all(8),

        // 2. Nama parameter diperbarui.
        hideNavigationBarWhenKeyboardAppears: true,

        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(81, 108, 108, 108),
              blurRadius: 10.5,
              spreadRadius: 0.1,
            ),
          ],
          colorBehindNavBar: Colors.white,
        ),
        // 3. Menerapkan perbaikan layout dari pertanyaan sebelumnya.
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
