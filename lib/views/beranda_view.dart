import 'package:apps_food/controller/beranda_controller.dart';
import 'package:apps_food/controller/main_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:apps_food/models/food_models.dart';
import 'package:apps_food/controller/food_controller.dart';
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

class BerandaView extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());
  // final GlobalController globalC = Get.find<GlobalController>();
  final globalC = Get.put(GlobalController());
  final controller = Get.put(BerandaController());

  BerandaView({super.key});
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Container(
                    //   height: 200,
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: BoxDecoration(
                    //     color: Utility.baseColor2,
                    //     image: DecorationImage(
                    //       alignment: Alignment.topCenter,
                    //       image: AssetImage('assets/mk_dashboard.png'),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    SafeArea(
                      // 🔥 Tambahkan bungkus SafeArea di sini
                      child: sliderBanner(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        children: [
                          SizedBox(height: Utility.extraLarge + Utility.large),
                          Obx(() => Text(controller.username.value)),

                          // userDeskripsi(),
                          SizedBox(height: Utility.normal),
                          // infoCard1(),
                          // sliderBanner(),
                        ],
                      ),
                    ),
                  ],
                ),
                // Expanded(
                //   child: SizedBox(
                //     height: double.maxFinite,
                //     child: SmartRefresher(
                //       physics: const BouncingScrollPhysics(),
                //       controller: _refreshController,
                //       onRefresh: _onRefresh,
                //       child: SingleChildScrollView(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             SizedBox(height: Utility.medium),
                //             if (controller.isKollek == 1) ...[
                //               /// Card Menu
                //               cardMenu(),

                //               SizedBox(height: Utility.medium),
                //             ],
                //             Padding(
                //               padding: const EdgeInsets.only(
                //                 left: 16.0,
                //                 right: 16.0,
                //                 bottom: 20,
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Container(
                //                     width: MediaQuery.of(context).size.width,
                //                     child: Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         const Expanded(
                //                           flex: 50,
                //                           child: Text(
                //                             "Dashboard",
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.w600,
                //                               fontSize: 18,
                //                             ),
                //                           ),
                //                         ),
                //                         Expanded(
                //                           flex: 20,
                //                           child: InkWell(
                //                             onTap: () async {
                //                               await showModalBottomSheet(
                //                                 backgroundColor:
                //                                     Colors.transparent,
                //                                 isScrollControlled: true,
                //                                 context: Get.context!,
                //                                 builder: (context) {
                //                                   return FractionallySizedBox(
                //                                     heightFactor: 1,
                //                                     child: _filterDashboard(),
                //                                   );
                //                                 },
                //                               );
                //                             },
                //                             child: Container(
                //                               decoration: BoxDecoration(
                //                                 borderRadius:
                //                                     BorderRadius.circular(4),
                //                                 border: Border.all(
                //                                   color: Utility.greyLight200,
                //                                 ),
                //                               ),
                //                               child: Padding(
                //                                 padding: EdgeInsets.all(8.0),
                //                                 child: Row(
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment
                //                                           .center,
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment
                //                                           .spaceBetween,
                //                                   children: [
                //                                     const Icon(
                //                                       Iconsax.setting_4,
                //                                       size: 16,
                //                                     ),
                //                                     Flexible(
                //                                       child: Text(
                //                                         // "${controller.bulanString.value.toString().substring(0, 3)} ${controller.tahun.value.toString()}",
                //                                         "Filter",
                //                                         overflow: TextOverflow
                //                                             .ellipsis,
                //                                       ),
                //                                     ),
                //                                     ArrowDropdown(),
                //                                   ],
                //                                 ),
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                   SizedBox(height: Utility.medium),
                //                   if (controller.isKollek == 1) ...[
                //                     SingleChildScrollView(
                //                       physics: const BouncingScrollPhysics(),
                //                       scrollDirection: Axis.horizontal,
                //                       child: SizedBox(
                //                         width: 660,
                //                         child: Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.start,
                //                           children: [
                //                             Expanded(
                //                               child: Container(
                //                                 margin: const EdgeInsets.only(
                //                                   right: 8,
                //                                 ),
                //                                 child: Obx(
                //                                   () => cardDashboard1(
                //                                     title: "Target Salesman",
                //                                     amount:
                //                                         Utility.rupiahFormat(
                //                                           controller
                //                                               .targetSales
                //                                               .toString(),
                //                                           "",
                //                                         ),
                //                                     icon: Iconsax.cup5,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: Container(
                //                                 margin: const EdgeInsets.only(
                //                                   right: 8,
                //                                 ),
                //                                 child: Obx(
                //                                   () => cardDashboard1(
                //                                     title: "Penjualan",
                //                                     amount:
                //                                         Utility.rupiahFormat(
                //                                           controller.penjualan
                //                                               .toString(),
                //                                           "",
                //                                         ),
                //                                     icon: Iconsax
                //                                         .shopping_cart5,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: SizedBox(
                //                                 child: Obx(
                //                                   () => cardDashboard1(
                //                                     title: "Piutang Outs",
                //                                     amount:
                //                                         Utility.rupiahFormat(
                //                                           controller.piutang
                //                                               .toString(),
                //                                           '',
                //                                         ),
                //                                     icon: Iconsax.money_send5,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(height: 8),
                //                     SingleChildScrollView(
                //                       physics: const BouncingScrollPhysics(),
                //                       scrollDirection: Axis.horizontal,
                //                       child: SizedBox(
                //                         width: 660,
                //                         child: Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.start,
                //                           children: [
                //                             Expanded(
                //                               child: Container(
                //                                 margin: const EdgeInsets.only(
                //                                   right: 8,
                //                                 ),
                //                                 child: Obx(
                //                                   () => cardDashboard1(
                //                                     title: "Penerimaan",
                //                                     amount:
                //                                         Utility.rupiahFormat(
                //                                           controller
                //                                               .penerimaan
                //                                               .toString(),
                //                                           '',
                //                                         ),
                //                                     icon: Iconsax.money_send5,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: Container(
                //                                 margin: const EdgeInsets.only(
                //                                   right: 8,
                //                                 ),
                //                                 child: Obx(
                //                                   () => cardDashboard1(
                //                                     title: "Total  Silver ",
                //                                     amount:
                //                                         Utility.rupiahFormat(
                //                                           controller
                //                                               .totalSilver
                //                                               .toString(),
                //                                           '',
                //                                         ),
                //                                     icon: Iconsax.money_send5,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: SizedBox(
                //                                 child: Obx(
                //                                   () => cardDashboard1(
                //                                     title: "Total Gold",
                //                                     amount:
                //                                         Utility.rupiahFormat(
                //                                           controller.totalGold
                //                                               .toString(),
                //                                           '',
                //                                         ),
                //                                     icon: Iconsax.money_send5,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(height: 24),
                //                     // TextLabell(
                //                     //     text: controller.filterChart
                //                     //         .where(
                //                     //             (p0) => p0['is_active'] == true)
                //                     //         .toList()
                //                     //         .toString()),
                //                     // TargetPenjualanSalesChart(),
                //                     Obx(
                //                       () =>
                //                           controller.isLoadingGrafik.value ==
                //                               true
                //                           ? Container(
                //                               width: MediaQuery.of(
                //                                 context,
                //                               ).size.width,
                //                               height: 200,
                //                               child: Column(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   CircularProgressIndicator(
                //                                     color: Utility.baseColor,
                //                                   ),
                //                                   SizedBox(height: 10),
                //                                   TextLabell(
                //                                     text: "Memuat Data",
                //                                   ),
                //                                 ],
                //                               ),
                //                             )
                //                           : controller.filterChart
                //                                     .where(
                //                                       (p0) =>
                //                                           p0['is_active'] ==
                //                                           true,
                //                                     )
                //                                     .toList()
                //                                     .first['id'] ==
                //                                 "target_penjualan"
                //                           ? TargetPenjualanSalesChart()
                //                           : controller.filterChart
                //                                     .where(
                //                                       (p0) =>
                //                                           p0['is_active'] ==
                //                                           true,
                //                                     )
                //                                     .toList()
                //                                     .first['id'] ==
                //                                 "piutang_penjualan"
                //                           ? PenjualanPiutangChart()
                //                           : piutangPenerimaanChart(),
                //                     ),
                //                   ],
                //                   const SizedBox(height: 24),
                //                   Obx(
                //                     () =>
                //                         controller.isLoadingTopBrand.value ==
                //                             true
                //                         ? SizedBox(
                //                             width: MediaQuery.of(
                //                               context,
                //                             ).size.width,
                //                             height: 200,
                //                             child: Column(
                //                               children: [
                //                                 CircularProgressIndicator(
                //                                   color: Utility.baseColor,
                //                                 ),
                //                                 const SizedBox(height: 10),
                //                                 const TextLabell(
                //                                   text: "Memuat Data",
                //                                 ),
                //                               ],
                //                             ),
                //                           )
                //                         : Container(
                //                             padding: const EdgeInsets.all(8),
                //                             decoration: BoxDecoration(
                //                               border: Border.all(
                //                                 width: 1,
                //                                 color: Utility.greyLight100,
                //                               ),
                //                               borderRadius:
                //                                   BorderRadius.circular(8),
                //                             ),
                //                             child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 const Padding(
                //                                   padding:
                //                                       EdgeInsets.fromLTRB(
                //                                         8.0,
                //                                         8.0,
                //                                         8.0,
                //                                         0.0,
                //                                       ),
                //                                   child: TextLabell(
                //                                     text:
                //                                         "Top 5 Best Seller (Brand)",
                //                                     weight: FontWeight.w500,
                //                                     size: 16,
                //                                   ),
                //                                 ),
                //                                 SfCircularChart(
                //                                   series: <CircularSeries>[
                //                                     // Renders doughnut chart
                //                                     DoughnutSeries<
                //                                       TopBrandModel,
                //                                       String
                //                                     >(
                //                                       enableTooltip: true,
                //                                       dataSource:
                //                                           controller.topBrand,
                //                                       pointColorMapper:
                //                                           (
                //                                             TopBrandModel
                //                                             data,
                //                                             _,
                //                                           ) => data.color,
                //                                       xValueMapper:
                //                                           (
                //                                             TopBrandModel
                //                                             data,
                //                                             _,
                //                                           ) => data.nama,
                //                                       yValueMapper:
                //                                           (
                //                                             TopBrandModel
                //                                             data,
                //                                             _,
                //                                           ) => data.totalQty,

                //                                       // Explode all the segments
                //                                     ),
                //                                   ],
                //                                   tooltipBehavior:
                //                                       _tooltipBehavior,
                //                                 ),
                //                                 Column(
                //                                   children: List.generate(
                //                                     controller
                //                                         .topBrand
                //                                         .length,
                //                                     (index) {
                //                                       var data = controller
                //                                           .topBrand[index];

                //                                       return Padding(
                //                                         padding:
                //                                             const EdgeInsets.only(
                //                                               top: 20,
                //                                               left: 8,
                //                                               right: 8,
                //                                             ),
                //                                         child: Row(
                //                                           children: [
                //                                             Expanded(
                //                                               flex: 5,
                //                                               child: Container(
                //                                                 width: 15,
                //                                                 height: 15,
                //                                                 decoration: BoxDecoration(
                //                                                   color: data
                //                                                       .color,
                //                                                   borderRadius:
                //                                                       BorderRadius.circular(
                //                                                         5,
                //                                                       ),
                //                                                 ),
                //                                               ),
                //                                             ),
                //                                             const SizedBox(
                //                                               width: 10,
                //                                             ),
                //                                             Expanded(
                //                                               flex: 60,
                //                                               child:
                //                                                   TextLabell(
                //                                                     text: data
                //                                                         .nama,
                //                                                     size: 10,
                //                                                   ),
                //                                             ),
                //                                             Expanded(
                //                                               flex: 40,
                //                                               child: TextLabell(
                //                                                 align:
                //                                                     TextAlign
                //                                                         .right,
                //                                                 text: helper
                //                                                     .numberFormat(
                //                                                       data.totalQty
                //                                                           .toString(),
                //                                                     )
                //                                                     .toString(),
                //                                                 size: 10,
                //                                               ),
                //                                             ),
                //                                           ],
                //                                         ),
                //                                       );
                //                                     },
                //                                   ),
                //                                 ),
                //                                 const SizedBox(height: 8),
                //                               ],
                //                             ),
                //                           ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             const SizedBox(height: 5),
                //             Padding(
                //               padding: const EdgeInsets.only(
                //                 left: 16,
                //                 right: 16,
                //               ),
                //               child: BirthDayay(),
                //             ),
                //             SizedBox(height: Utility.large),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sliderBanner() {
    return CarouselSlider.builder(
      carouselController: controller.corouselBeranda,
      itemCount: controller.listBanner.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(controller.listBanner[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200.0, //
        autoPlay: true, //
        autoPlayInterval: const Duration(seconds: 3), // Jeda tiap slide 3 detik
        viewportFraction:
            1.0, // Supaya gambarnya full lebar (tidak ngintip kiri kanan)
        onPageChanged: (index, reason) {
          controller.indexBanner.value = index;
        },
      ),
    );
  }

  Widget infoCard1() {
    return CardCustom(
      colorBg: Utility.baseColor2,
      radiusBorder: Utility.borderStyle2,
      widgetCardCustom: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 49,
              child: InkWell(
                // onTap: () {
                //   DatePicker.showPicker(
                //     Get.context!,
                //     pickerModel: CustomMonthPicker(
                //       minTime: DateTime(2020, 1, 1),
                //       maxTime: DateTime(2050, 1, 1),
                //       currentTime: DateTime.now(),
                //     ),
                //     // onConfirm: (time) {
                //     //   if (time != null) {
                //     //     // print("$time");
                //     //     setState(() {
                //     //       controller.periodeDateSelected.value = time;
                //     //       controller.periodeDateSelected.refresh();
                //     //       controller.prosesDateNow();
                //     //     });
                //     //   }
                //     // },
                //   );
                // },
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 15,
                        child: Icon(
                          Iconsax.calendar5,
                          color: Utility.primaryDefault,
                        ),
                      ),
                      Expanded(
                        flex: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Periode",
                                style: TextStyle(
                                  color: Utility.nonAktif,
                                  fontSize: Utility.normal,
                                ),
                              ),
                              Text(
                                "Periode",
                                style: TextStyle(
                                  color: Utility.baseColor1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Iconsax.arrow_down_1,
                            size: 18,
                            color: Utility.nonAktif,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                  width: 1.5,
                  color: Color.fromARGB(24, 0, 22, 103),
                ),
              ),
            ),
            Expanded(
              flex: 49,
              child: InkWell(
                // onTap: () {
                //   // print(controller.kodeCabangSelected.value);
                //   GlobalBottomSheet().buttomSheetGlobal(
                //     controller.listCabang,
                //     "Pilih Cabang",
                //     "pilih_cabang",
                //     controller.kodeCabangSelected.value,
                //   );
                //   if (controller.listCabang.length > 1) {}
                // },
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Icon(
                            Iconsax.buildings_25,
                            color: Utility.primaryDefault,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cabang",
                                style: TextStyle(
                                  color: Utility.nonAktif,
                                  fontSize: Utility.normal,
                                ),
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 11.0),
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Utility.baseColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  text: "Cabang Dika",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Iconsax.arrow_down_1,
                            size: 18,
                            color: Utility.nonAktif,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         "Food Delivery 🍔",
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       backgroundColor: Utility.baseColor,
  //     ),
  //     backgroundColor: Colors.grey[100],
  //     body: Obx(() {
  //       if (foodController.listmakanan.isEmpty) {
  //         return const Center(child: CircularProgressIndicator());
  //       }

  //       return ListView.builder(
  //         itemCount: foodController.listmakanan.length,
  //         itemBuilder: (context, index) {
  //           var menu = foodController.listmakanan[index];

  //           return Card(
  //             margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
  //             elevation: 3,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(15),
  //             ),
  //             child: ListTile(
  //               contentPadding: const EdgeInsets.all(10),
  //               leading: ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: Image.network(
  //                   menu.gambar,
  //                   width: 60,
  //                   height: 60,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               title: Text(
  //                 menu.nama,
  //                 style: const TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //               subtitle: Padding(
  //                 padding: const EdgeInsets.only(top: 8.0),
  //                 child: Text(
  //                   "Rp ${globalC.FormatNumber_(menu.harga.toInt())}\n⭐ ${menu.rating}",
  //                   style: TextStyle(
  //                     color: Colors.orange[800],
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),

  //               trailing: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.orange,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   Get.snackbar(
  //                     "Masuk Keranjang 🛒",
  //                     "${menu.nama} berhasil ditambahkan!",
  //                     snackPosition: SnackPosition.BOTTOM,
  //                     backgroundColor: Colors.green,
  //                     colorText: Colors.white,
  //                   );
  //                 },
  //                 child: const Text(
  //                   "Beli",
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     }),
  //   );
  // }
}
