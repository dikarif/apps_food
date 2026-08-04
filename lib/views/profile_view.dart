import 'package:apps_food/controller/beranda_controller.dart';
import 'package:apps_food/controller/main_dashboard_controller.dart';
import 'package:apps_food/models/penjual_models.dart';
import 'package:flutter/material.dart';
import 'package:apps_food/models/food_models.dart';
import 'package:apps_food/controller/food_controller.dart';
import 'package:apps_food/controller/penjual_controller.dart';
import 'package:apps_food/utils/widget/card_custom.dart';
import 'package:apps_food/controller/global_controller.dart';
import 'package:apps_food/utils/utility.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apps_food/utils/widget/button.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileView> {
  final FoodController foodController = Get.put(FoodController());
  final penjualcontroller = Get.put(PenjualController());
  final globalC = Get.put(GlobalController());
  final controller = Get.put(BerandaController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utility.baseColor2,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: Utility.borderStyle4,
                  color: Utility.baseColor2,
                  image: const DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/bg_profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // sliderBanner(),
                    const SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: User(),
                    ),

                    SizedBox(height: Utility.large),
                    Divider(
                      height: 5.0,
                      thickness: 5.0,
                      color: Utility.greyLight100,
                    ),

                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          24.0,
                          20.0,
                          24.0,
                          20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 90,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Iconsax.logout_15,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 16,
                                          top: 3,
                                        ),
                                        child: Text(
                                          "Keluar",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 5.0,
                      thickness: 5.0,
                      color: Utility.greyLight100,
                    ),

                    // Expanded(
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //             left: 12.0,
                    //             right: 12.0,
                    //           ),
                    //           child: menuLine1(),
                    //         ),
                    //         const SizedBox(height: 16),

                    //         // -- Judul Rekomendasi --
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //             left: 12.0,
                    //             right: 12.0,
                    //           ),
                    //           child: Text(
                    //             "Rekomendasi Special Untuk Kamu",
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: Utility.large,
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(height: 10),

                    //         SizedBox(
                    //           height: 190,
                    //           child: ListView.builder(
                    //             scrollDirection: Axis.horizontal,
                    //             padding: const EdgeInsets.symmetric(
                    //               horizontal: 12.0,
                    //             ),
                    //             itemCount:
                    //                 foodController.lismakananarekomen.length,
                    //             itemBuilder: (context, index) {
                    //               return cardRekomendasiMakanan(
                    //                 foodController.lismakananarekomen[index],
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //         const SizedBox(height: 16),

                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //             left: 12.0,
                    //             right: 12.0,
                    //           ),
                    //           child: Text(
                    //             "Restaurant Atau Toko Terdekat",
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: Utility.large,
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(height: 10),

                    //         ListView.builder(
                    //           shrinkWrap: true, // Wajib agar tinggi dinamis
                    //           physics:
                    //               const NeverScrollableScrollPhysics(), // Wajib agar gabung dengan scroll utama
                    //           padding: const EdgeInsets.symmetric(
                    //             horizontal: 12.0,
                    //           ),
                    //           itemCount: penjualcontroller.listtoko.length,
                    //           itemBuilder: (context, index) {
                    //             return cardRestoTerdekat(
                    //               penjualcontroller.listtoko[index],
                    //             );
                    //           },
                    //         ),

                    //         const SizedBox(height: 32),
                    //       ],
                    //     ),
                    //   ),
                    // ), // Penutup Expanded
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget User() {
    return CardCustom(
      colorBg: Colors.white,
      radiusBorder: Utility.borderStyle3,
      borderColor: Utility.infoDark,
      widgetCardCustom: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Utility.baseColor,
              child: const Text(
                "AR",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ARIEF DIKA RIFALDI",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                const Text(
                  "dikaaruef@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Iconsax.edit, color: Utility.greyDefault, size: 35),
              splashRadius: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardCustomShadow(
              colorBg: Utility.baseColor2,
              radiusBorder: Utility.borderStyle1,
              widgetCardCustom: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Menu Line 1
                    menuLine1(),
                    SizedBox(height: Utility.normal),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuLine1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: InkWell(
                // onTap: () {
                //   controller.routeMenu("Order Penjualan");
                // },
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Utility.baseColor,
                            borderRadius: Utility.borderStyle4,
                          ),
                          child: Image.asset(
                            'assets/order.png',
                            width: 45,
                            height: 45,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Dipesan \n Makanan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utility.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: InkWell(
                // onTap: () {
                //   controller.routeMenu("Order Penjualan");
                // },
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Utility.baseColor,
                            borderRadius: Utility.borderStyle4,
                          ),
                          child: Image.asset(
                            'assets/best_seller.png',
                            width: 55,
                            height: 55,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Menu \n Terlaris",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utility.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 8,
              child: InkWell(
                // onTap: () {
                //   controller.routeMenu("Order Penjualan");
                // },
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Utility.baseColor,
                            borderRadius: Utility.borderStyle4,
                          ),
                          child: Image.asset(
                            'assets/promo.png',
                            width: 55,
                            height: 55,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Promo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utility.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 8,
              child: InkWell(
                // onTap: () {
                //   controller.routeMenu("Order Penjualan");
                // },
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Utility.baseColor,
                            borderRadius: Utility.borderStyle4,
                          ),
                          child: Image.asset(
                            'assets/delivery.png',
                            width: 55,
                            height: 55,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Lacak \n Pesanan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utility.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
      ],
    );
  }

  Widget MenuDashboard() {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width,
      height: 200, //controller.heightPageView.value / 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Menu Semua
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                // onTap: () async {
                //   internetController.isConnected.value
                //       ? dashboardController.widgetButtomSheetMenuLebihDetail()
                //       : UtilsAlert.showDialogCheckInternet();
                // },
                highlightColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Utility.infoLigh50,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8),
                          child: SvgPicture.asset(
                            'assets/1_more.svg',
                            height: 42,
                            width: 42,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Semua",
                      style: GoogleFonts.inter(
                        color: Utility.primaryBg1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Other Menu
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller
                    .listBanner
                    .length, //controller.menuShowInMain.value.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idxMenu) {
                  var gambar = "";
                  //dashboardController.menuShowInMain[idxMenu]['gambar'];

                  var namaMenu = "";
                  // dashboardController.menuShowInMain[idxMenu]['nama'];

                  return Padding(
                    padding: EdgeInsets.only(
                      left: idxMenu == 0 ? 16.0 : 0.0,
                      right: idxMenu == 0
                          ? 28.0
                          : idxMenu == 1
                          ? 28.0
                          : idxMenu == 2
                          ? 28.0
                          : idxMenu == 3
                          ? 18.0
                          : idxMenu == 4
                          ? 18.0
                          : idxMenu == 5
                          ? 25.0
                          : idxMenu == 6
                          ? 30.0
                          : idxMenu == 7
                          ? 25
                          : 30.0,
                    ),
                    child: InkWell(
                      // onTap: () => internetController.isConnected.value
                      //     ? dashboardController.routePageDashboard(
                      //         dashboardController
                      //             .menuShowInMain[idxMenu]['url'],
                      //         null,
                      //       )
                      //     : UtilsAlert.showDialogCheckInternet(),
                      highlightColor: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Gambar
                          Stack(
                            children: [
                              Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                  color: Utility.infoLigh50,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: SvgPicture.asset(
                                  // gambar == "watch.png"
                                  //     ? 'assets/2_absen.svg'
                                  //     : gambar == "tidak_masuk.png"
                                  //     ? 'assets/3_izin.svg'
                                  //     : gambar == "clock.png"
                                  //     ? 'assets/4_lembur.svg'
                                  //     : gambar == "riwayat_cuti.png"
                                  //     ? 'assets/5_cuti.svg'
                                  //     : gambar == "tugas_luar.png"
                                  //     ? 'assets/6_tugas_luar.svg'
                                  //     : gambar == "limit_claim.png"
                                  //     ? 'assets/7_klaim.svg'
                                  //     : gambar == "8_kandidat.png"
                                  //     ? 'assets/profile_kandidat.svg'
                                  'assets/order.png',
                                  height: 42,
                                  width: 42,
                                ),
                              ),
                            ],
                          ),
                          // : Container(
                          //     color: Utility.baseColor,
                          //     height: 32,
                          //     width: 32,
                          //   ),
                          const SizedBox(height: 4),

                          // Nama Menu
                          Text(
                            namaMenu.length > 20
                                ? namaMenu.substring(0, 20) + '...'
                                : namaMenu,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Utility.primaryBg1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        // Column(
        //   children: [

        //     SizedBox(height: 5,),
        //     Divider(height: 5, color: Constanst.colorNonAktif,),
        //     SizedBox(height: 20,
        //       child: Center(child: Text("Menu Lainnya", style: TextStyle(fontSize: 12),),),
        //     )
        //   ],
        // )
      ),
    );
  }

  Widget cardRekomendasiMakanan(FoodModelRekomen data) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),

            child: Image.asset(
              data.gambarRekomen,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.namarekomen,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Rp ${globalC.FormatNumber_(data.hargarekomen.toInt())}",
                  style: TextStyle(
                    color: Utility.baseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardRestoTerdekat(PenjualModel data) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
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
          // GAMBAR & RATING
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              children: [
                Image.asset(
                  data.gambar,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          "4.8",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Toko
                Text(
                  data.toko,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                // Alamat
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        data.alamat,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                Divider(height: 1, color: Colors.grey[200]),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      "15 mnt",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
