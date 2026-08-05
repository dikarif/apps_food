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
                                        Iconsax.shop5,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 16,
                                          top: 3,
                                        ),
                                        child: Text(
                                          "Buka Toko / Restaurant",
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
                    fontSize: 20,
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
}
