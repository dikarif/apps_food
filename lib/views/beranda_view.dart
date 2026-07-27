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
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    Container(
                      height: 270,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Utility.baseColor2,
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/bg_dashboard2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          sliderBanner(),
                          const SizedBox(height: 11),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                            ),
                            child: screenCaridanFilter(),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            // Gunakan angka yang agak besar (misal 16.0) agar terlihat mengecil
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                            ),
                            child: CardCustom(
                              colorBg: Utility.baseColor2,
                              radiusBorder: Utility.borderStyle3,
                              borderColor: Utility.infoDark,
                              widgetCardCustom: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 15, child: menuLine1()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    //   child: Column(
                    //     children: [
                    //       SizedBox(height: Utility.extraLarge + Utility.large),
                    //       Obx(() => Text(controller.username.value)),

                    //       // userDeskripsi(),
                    //       SizedBox(height: Utility.normal),
                    //       // infoCard1(),
                    //       // sliderBanner(),
                    //     ],
                    //   ),
                    // ),
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

  Widget screenCaridanFilter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Expanded(flex: 85, child: pencarianData())],
    );
  }

  Widget pencarianData() {
    return CardCustom(
      colorBg: Colors.white,
      radiusBorder: Utility.borderStyle3,
      borderColor: Utility.infoDark,
      widgetCardCustom: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.only(top: 7, left: 0),
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Icon(Iconsax.search_normal_1, size: 18),
              ),
            ),
          ),
          Expanded(
            flex: 85,
            child: SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 80,
                    child: TextField(
                      // controller: controller.cari.value,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cari",
                      ),
                      textInputAction: TextInputAction.done,
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        height: 1.5,
                        color: Colors.black,
                      ),
                      // onChanged: (value) {
                      //   controller.textCariStokopname.value = value;
                      //   controller.filterOpnameHD();
                      // },
                    ),
                  ),
                  // !controller.statusCari.value
                  //     ? SizedBox()
                  //     : Expanded(
                  //         flex: 20,
                  //         child: IconButton(
                  //           icon: Icon(Iconsax.close_circle, color: Colors.red),
                  //           onPressed: () {
                  //             setState(() {
                  //               controller.cari.value.text = "";
                  //               controller.statusCari.value = false;
                  //               controller.statusCari.refresh();
                  //               controller.listAllOPNAMEHDShow.value =
                  //                   controller.listAllOPNAMEHD.value;
                  //               controller.listAllOPNAMEHDShow.refresh();
                  //             });
                  //           },
                  //         ),
                  //       ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 1.0, right: 1.0),
      child: SizedBox(
        width: MediaQuery.of(Get.context!).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider.builder(
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
                autoPlayInterval: const Duration(
                  seconds: 3,
                ), // Jeda tiap slide 3 detik
                viewportFraction:
                    1.0, // Supaya gambarnya full lebar (tidak ngintip kiri kanan)
                onPageChanged: (index, reason) {
                  controller.indexBanner.value = index;
                },
              ),
            ),
            DotsIndicator(
              dotsCount: controller.listBanner.length,
              // position: int.parse("${dashboardController.indexBanner.value}"),
              position: controller.indexBanner.value.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(6.0),
                activeColor: Utility.infoLigh50,
                activeSize: const Size(16.0, 6.0),
                spacing: const EdgeInsets.fromLTRB(0.0, 8.0, 4.0, 0.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ],
        ),
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
                    // !controller.showLineMenu.value ? SizedBox() : menuLine2(),

                    /// Menu Line 2
                    // menuLine2(),

                    // SizedBox(height: Utility.normal),
                    // InkWell(
                    //   onTap: () {
                    //     controller.showLineMenu.value =
                    //         !controller.showLineMenu.value;
                    //     controller.showLineMenu.refresh();
                    //   },
                    //   child: SizedBox(
                    //     width: 200,
                    //     child: Center(
                    //       child: !controller.showLineMenu.value
                    //           ? Icon(
                    //               Iconsax.arrow_down_1,
                    //               size: 18,
                    //             )
                    //           : Icon(
                    //               Iconsax.arrow_up_2,
                    //               size: 18,
                    //             ),
                    //     ),
                    //   ),
                    // )
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
        const SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
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
                          alignment: Alignment
                              .center, // 🔥 Ini kunci agar gambar otomatis persis di tengah
                          decoration: BoxDecoration(
                            color: Utility.baseColor,
                            borderRadius: Utility
                                .borderStyle5, // Pastikan variabel ini ada di utility Mas Dika
                          ),
                          child: Image.asset(
                            'assets/order.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Dipesan \nMakanan",
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
              flex: 4,
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
                            borderRadius: Utility.borderStyle5,
                          ),
                          child: Image.asset(
                            'assets/order.png',
                            width: 28,
                            height: 28,
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
            const Spacer(flex: 8),
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
