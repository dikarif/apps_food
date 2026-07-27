import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:apps_food/utils/widget/text_label.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

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

  Future<void> startLoad() async {
    // void startLoad() {
    // prosesDateNow();
    // prosesInformasiUser();
    // prosesInformasiCabang();
    // prosesInformasiSysData();
    getStatusAktif();
  }

  void UpdateDashboard() {
    // informasiDashboard1();
    // infromasiGrafik();
    // fetchTopBrand();
    // getUlangTahun();

    print("update Dashboard");
  }

  // void prosesDateNow() async {
  //   String bulanPeriode =
  //       "${DateFormat('MMM').format(periodeDateSelected.value)}";
  //   String tahunPeriode =
  //       "${DateFormat('y').format(periodeDateSelected.value)}";
  //   periodeTerpilih.value = "$bulanPeriode, $tahunPeriode";
  //   periodeTerpilih.refresh();
  //   getUlangTahun();
  //   fetchTopBrand();
  // }

  var filterChart = [
    {
      'id': 'target_penjualan',
      'name': 'Target VS Penjualan',
      'is_active:': true,
    },
    // {
    //   'id': 'piutang_penjualan',
    //   'name': 'Penjualan vs Piutang',
    //   'is_active:': false
    // },
    {
      'id': 'piutang_penerimaan',
      'name': 'Piutang Vs Penerimaan',
      'is_active:': false,
    },
  ].obs;

  // void prosesInformasiUser() {
  //   var dataInformasiUser = AppData.informasiLoginUser;
  //   if (dataInformasiUser != null) {
  //     username.value = dataInformasiUser[0].name ?? "";
  //     username.refresh();

  //     emailUser.value = dataInformasiUser[0].userEmail ?? "";
  //     emailUser.refresh();
  //   }
  // }

  // Future<void> getSizeDevice() async {
  //   double width = MediaQuery.of(Get.context!).size.width;
  //   double height = MediaQuery.of(Get.context!).size.height;
  //   tinggiHp.value = height;
  //   if (width <= 395.0 || width <= 425.0) {
  //     print("kesini mobile kecil");
  //     deviceStatus.value = false;
  //     heightbanner.value = 120.0;
  //     heightPageView.value = 155.0;
  //     ratioDevice.value = 2.0;
  //   } else if (width >= 425.0) {
  //     print("kesini mobile besar");
  //     heightbanner.value = 200.0;
  //     heightPageView.value = 180.0;
  //     ratioDevice.value = 3.0;
  //     deviceStatus.value = true;
  //   }
  // }

  void getStatusAktif() async {}

  // Future<List> prosesInformasiSysData() async {
  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   String hasilPeriode = await getPeriode;

  //   Map<String, dynamic> body = {
  //     'user_akses': AppData.informasiHost![0].username,
  //     'hostname': AppData.informasiHost![0].hostname,
  //     'database': AppData.informasiHost![0].dbname,
  //     'tabel': "SYSDATA",
  //     'type_database': "",
  //     "database_periode1": hasilPeriode,
  //   };
  //   Future<List> infoSysdata = GetDataController().queryGlobal(
  //     body,
  //     "all_sysdata",
  //   );
  //   List hasilSysdata = await infoSysdata;
  //   List hasilData = [];
  //   if (hasilSysdata[0] == true) {
  //     List<InformasiSysData> getDataSysdata = [];
  //     for (var element in hasilSysdata[2]) {
  //       getDataSysdata.add(
  //         InformasiSysData(kode: element["KODE"], nama: element["NAMA"]),
  //       );
  //     }
  //     print("sysdata perusaahan ${hasilSysdata[2]}");
  //     AppData.sysDataPerusahaan = getDataSysdata;
  //     hasilData = hasilSysdata[2];
  //   } else {
  //     UtilsAlert.showToast("Data sysdata tidak di temukan");
  //   }
  //   return Future.value(hasilData);
  // }

  // Future<void> informasiDashboard() async {
  //   // void informasiDashboard() async {
  //   print("${tahun.value.toString().substring(2, 4)}${bulanString.value}");

  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   var hasilPeriode = await getPeriode;

  //   Map<String, dynamic> body = {
  //     'user_akses': AppData.informasiHost![0].username,
  //     'hostname': AppData.informasiHost![0].hostname,
  //     // 'database': hasilPeriode,
  //     'database':
  //         "${AppData.informasiHost![0].dbname}${tahun.value.toString().substring(2, 4)}${bulan.value}",
  //     'tabel': '',
  //     "kode_sales":
  //         salesmanCode.value == "" ||
  //             salesmanCode.value == null ||
  //             salesmanCode.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeSales
  //         : salesmanCode.value,
  //     "kode_cabang":
  //         kodeCabangSelected.value == "" ||
  //             kodeCabangSelected.value == null ||
  //             kodeCabangSelected.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeCabang
  //         : kodeCabangSelected.value,
  //   };
  //   print(body);

  //   try {
  //     Future<List> prosesInsertDataSOHD = GetDataController().queryGlobal(
  //       body,
  //       "informasi_dashboard",
  //     );
  //     var data = await prosesInsertDataSOHD;
  //     print("Informasi dashboard ${data}");
  //     if (data[0] == true) {
  //       List d = data[2];

  //       targetSales.value = "${d[0]['target_sales'][0]['TARGET']}";
  //       penjualan.value = d[1]['penjualan'][0]['TOTAL'].toString();
  //       piutang.value = d[2]['piutang'][0]['TOTAL'].toString();
  //       penerimaan.value = d[3]['penerimaan'][0]['TOTAL'].toString();
  //       totalGold.value = d[4]['total_gold'][0]['TOTAL'].toString();
  //       totalSilver.value = d[5]['total_silver'][0]['TOTAL'].toString();
  //     } else {
  //       print(data[1]);
  //     }
  //   } catch (e) {
  //     print("error ${e}");
  //   }
  // }

  // void informasiDashboard1() async {
  //   UtilsAlert.showLoadingIndicator(Get.context!, "tunggu sebentar...");
  //   print("${tahun.value.toString().substring(2, 4)}${bulanString.value}");

  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   var hasilPeriode = await getPeriode;

  //   Map<String, dynamic> body = {
  //     'user_akses': AppData.informasiHost![0].username,
  //     'hostname': AppData.informasiHost![0].hostname,
  //     // 'database': hasilPeriode,
  //     'database':
  //         "${AppData.informasiHost![0].dbname}${tahun.value.toString().substring(2, 4)}${bulan.value}",
  //     'tabel': '',
  //     "kode_sales":
  //         salesmanCode.value == "" ||
  //             salesmanCode.value == null ||
  //             salesmanCode.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeSales
  //         : salesmanCode.value,
  //     "kode_cabang":
  //         kodeCabangSelected.value == "" ||
  //             kodeCabangSelected.value == null ||
  //             kodeCabangSelected.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeCabang
  //         : kodeCabangSelected.value,
  //   };

  //   try {
  //     Future<List> prosesInsertDataSOHD = GetDataController().queryGlobal(
  //       body,
  //       "informasi_dashboard",
  //     );
  //     var data = await prosesInsertDataSOHD;
  //     if (data[0] == true) {
  //       List d = data[2];

  //       Get.back();

  //       targetSales.value = "${d[0]['target_sales'][0]['TARGET']}";
  //       penjualan.value = d[1]['penjualan'][0]['TOTAL'].toString();
  //       piutang.value = d[2]['piutang'][0]['TOTAL'].toString();
  //       penerimaan.value = d[3]['penerimaan'][0]['TOTAL'].toString();
  //     } else {
  //       Get.back();
  //       print(data[1]);
  //     }
  //   } catch (e) {
  //     Get.back();
  //     print("error ${e}");
  //   }
  // }

  // Future<void> GetSalesman() async {
  //   // void GetSalesman() async {
  //   salesManName.value = "";
  //   salesmanCode.value = "";
  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   String hasilPeriode = await getPeriode;
  //   if (AppData.informasiUserAkses![0].kodeSales == "" ||
  //       AppData.informasiUserAkses![0].kodeSales == null) {
  //     Map<String, dynamic> body = {
  //       'user_akses': AppData.informasiHost![0].username,
  //       'hostname': AppData.informasiHost![0].hostname,
  //       'database': AppData.informasiHost![0].dbname,
  //       "database_periode1": hasilPeriode,
  //       'tabel': "SALESM",
  //       'type_database': "",
  //       "kode_cabang":
  //           kodeCabangSelected.value == "" ||
  //               kodeCabangSelected.value == null ||
  //               kodeCabangSelected.value == "null"
  //           ? AppData.informasiUserAkses![0].kodeCabang
  //           : kodeCabangSelected.value,
  //       "kode_sales":
  //           salesmanCode.value == "" ||
  //               salesmanCode.value == null ||
  //               salesmanCode.value == "null"
  //           ? AppData.informasiUserAkses![0].kodeSales
  //           : salesmanCode.value,
  //     };

  //     Future<List> infoSales = GetDataController().queryGlobal(
  //       body,
  //       "list_all_salesm",
  //     );
  //     List hasilSales = await infoSales;
  //     if (hasilSales[0] == true) {
  //       salesman.value = hasilSales[2];
  //       salesman.sort((a, b) {
  //         return a['NAMA'].toLowerCase().compareTo(b['NAMA'].toLowerCase());
  //       });
  //     } else {
  //       UtilsAlert.showToast("Data sales tidak di temukan");
  //     }
  //   } else {
  //     Map<String, dynamic> body = {
  //       'user_akses': AppData.informasiHost![0].username,
  //       'hostname': AppData.informasiHost![0].hostname,
  //       'database': AppData.informasiHost![0].dbname,
  //       'database_periode1': hasilPeriode,
  //       'tabel': "SALESM",
  //       'type': 1,
  //       'column1': "GRUPSALES",
  //       'cari1': AppData.informasiUserAkses![0].kodeSales,
  //     };
  //     Future<List> infoSales = GetDataController().queryGlobal(
  //       body,
  //       "list_salesm",
  //     );
  //     List hasilSales = await infoSales;
  //     if (hasilSales[0] == true) {
  //       salesman.value = hasilSales[2];
  //       if (salesman.value.length > 0) {
  //         salesManName.value = salesman[0]['NAMA'];
  //         salesmanCode.value = salesman[0]['KODE'];

  //         salesManNameDefault.value = salesman[0]['NAMA'];
  //         salesmanCodeDefault.value = salesman[0]['KODE'];
  //       } else {
  //         salesManName.value = "";
  //         salesmanCode.value = "";
  //       }
  //     } else {
  //       UtilsAlert.showToast("Data sales tidak di temukan");
  //     }
  //   }
  // }

  // Future<void> getUlangTahun() async {
  //   // void getUlangTahun() async {
  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   var hasilPeriode = await getPeriode;
  //   var bulan = hasilPeriode.substring(hasilPeriode.length - 2);
  //   var tahun = "${DateFormat('yyyy').format(periodeDateSelected.value)}";
  //   Map<String, dynamic> body = {
  //     'user_akses': AppData.informasiHost![0].username,
  //     'hostname': AppData.informasiHost![0].hostname,
  //     'database': hasilPeriode,
  //     'bulan': bulan,
  //     'tahun': tahun,
  //     "kode_sales":
  //         salesmanCode.value == "" ||
  //             salesmanCode.value == null ||
  //             salesmanCode.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeSales
  //         : salesmanCode.value,
  //   };
  //   print("body ulang");
  //   print(body);
  //   Future<List> infoSales = GetDataController().queryGlobal(
  //     body,
  //     "informasi_ultah_customer",
  //   );
  //   var hasilSales = await infoSales;
  //   if (hasilSales[0] == true) {
  //     ulangtahun.value = hasilSales[2];
  //   } else {
  //     ulangtahun.value = [];
  //     // UtilsAlert.showToast("Data ulang tahun tidak di temukan");
  //   }
  // }

  // Future<void> fetchTopBrand() async {
  //   // void fetchTopBrand() async {
  //   print("update top brand");
  //   isLoadingTopBrand.value = true;
  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   var hasilPeriode = await getPeriode;
  //   print("Masuk top branc");
  //   Map<String, dynamic> body = {
  //     'user_akses': AppData.informasiHost![0].username,
  //     'hostname': AppData.informasiHost![0].hostname,
  //     'database': hasilPeriode,
  //     "kode_cabang":
  //         kodeCabangSelected.value == "" ||
  //             kodeCabangSelected.value == null ||
  //             kodeCabangSelected.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeCabang
  //         : kodeCabangSelected.value,
  //     'database_master': "${AppData.informasiHost![0].dbname}",
  //     "kode_sales":
  //         salesmanCode.value == "" ||
  //             salesmanCode.value == null ||
  //             salesmanCode.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeSales
  //         : salesmanCode.value,
  //   };
  //   print(body);
  //   Future<List> infoSales = GetDataController().queryGlobal(
  //     body,
  //     "top_brand_dashboard",
  //   );
  //   var hasilSales = await infoSales;
  //   print("hasil top brand ${hasilSales[1]}");
  //   if (hasilSales[0] == true) {
  //     print("data top brand ${hasilSales[2]}");
  //     topBrand.value = TopBrandModel.fromJsonToList(hasilSales[2]);
  //     var j = 0;
  //     for (var i = 0; i < topBrand.length; i++) {
  //       topBrand[j].color = dataColor[j];
  //       j = j + 1;
  //     }

  //     isLoadingTopBrand.value = false;

  //     // ulangtahun.value = hasilSales[2];
  //   } else {
  //     topBrand.value = [];
  //     isLoadingTopBrand.value = false;
  //     // UtilsAlert.showToast("Data sales tidak di temukan");
  //   }
  // }

  // Future<void> infromasiGrafik() async {
  //   // void infromasiGrafik() async {
  //   isLoadingGrafik.value = true;
  //   targetSalesList.clear();
  //   TargetPenjualanLList.clear();
  //   targetPenerimaanList.clear();
  //   targetPiutangList.clear();

  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   var hasilPeriode = await getPeriode;
  //   Map<String, dynamic> body = {
  //     'user_akses': AppData.informasiHost![0].username,
  //     'hostname': AppData.informasiHost![0].hostname,
  //     'database': AppData.informasiHost![0].dbname,
  //     'database_periode1': hasilPeriode,
  //     "tahun": tahun.value,
  //     "kode_cabang":
  //         kodeCabangSelected.value == "" ||
  //             kodeCabangSelected.value == null ||
  //             kodeCabangSelected.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeCabang
  //         : kodeCabangSelected.value,
  //     "kode_sales":
  //         salesmanCode.value == "" ||
  //             salesmanCode.value == null ||
  //             salesmanCode.value == "null"
  //         ? AppData.informasiUserAkses![0].kodeSales
  //         : salesmanCode.value,
  //   };

  //   Future<List> infoSales = GetDataController().queryGlobal(
  //     body,
  //     "informasi_dashboard_grafik",
  //   );
  //   var hasilSales = await infoSales;

  //   if (hasilSales[0] == true) {
  //     List dataTarget = hasilSales[2][0];
  //     List dataPenjualan = hasilSales[2][1];
  //     List dataPenerimaan = hasilSales[2][3];
  //     List dataPiutang = hasilSales[2][2];
  //     print(dataPiutang);

  //     var i = 0;
  //     var j = 0;
  //     var k = 0;
  //     var x = 0;
  //     dataTarget.forEach((element) {
  //       List target = element['target_sales'];
  //       List penjualan = dataPenjualan[i]['penjualan'];

  //       targetSalesList.add(
  //         GrafikDashboardModel(
  //           priode: helper.periodeMonth(element['periode_bulan'].toString()),
  //           amountTarget: target.isNotEmpty
  //               ? target[0]['TARGET'].toString()
  //               : "0",
  //           amountPenjualan: penjualan.isNotEmpty
  //               ? penjualan[0]['TOTAL'].toString()
  //               : "0",
  //         ),
  //       );
  //       i = i + 1;
  //     });

  //     dataPenjualan.forEach((element) {
  //       List penjualan = element['penjualan'];
  //       List piutang = dataPiutang[j]['piutang'];

  //       TargetPenjualanLList.add(
  //         GrafikDashboardModel(
  //           priode: helper.periodeMonth(element['periode_bulan'].toString()),
  //           amountPiutang: piutang.isNotEmpty
  //               ? piutang[0]['TOTAL'].toString()
  //               : "0",
  //           amountPenjualan: penjualan.isNotEmpty
  //               ? penjualan[0]['TOTAL'].toString()
  //               : "0",
  //         ),
  //       );
  //       j = j + 1;
  //     });

  //     dataPenerimaan.forEach((element) {
  //       List penerimaan = element['penerimaan'];
  //       List piutang = dataPiutang[k]['piutang'];

  //       targetPenerimaanList.add(
  //         GrafikDashboardModel(
  //           priode: helper.periodeMonth(element['periode_bulan'].toString()),
  //           amountPiutang: piutang.isNotEmpty
  //               ? piutang[0]['TOTAL'].toString()
  //               : "0",
  //           amountPenerimaan: penerimaan.isNotEmpty
  //               ? penerimaan[0]['TOTAL'].toString()
  //               : "0",
  //         ),
  //       );
  //       k = k + 1;
  //     });

  //     // dataPenjualan.forEach((element) {
  //     //   List d = element['penjualan'];
  //     //   targetSalesList.add(GrafikDashboardModel.fromJson({
  //     //     "periode": helper.periodeMonth(element['periode'].toString()),
  //     //     "TOTAL": d.isNotEmpty ? d[0]['TOTAL'].toString() : "0"
  //     //   }));
  //     // });

  //     // dataPiutang.forEach((element) {
  //     //   List d = element['piutang'];
  //     //   targetSalesList.add(GrafikDashboardModel.fromJson({
  //     //     "periode": helper.periodeMonth(element['periode'].toString()),
  //     //     "TOTAL": d.isNotEmpty ? d[0]['TOTAL'].toString() : "0"
  //     //   }));
  //     // });

  //     // dataPenerimaan.forEach((element) {
  //     //   List d = element['penerimaan'];
  //     //   targetSalesList.add(GrafikDashboardModel.fromJson({
  //     //     "periode": helper.periodeMonth(element['periode'].toString()),
  //     //     "TOTAL": d.isNotEmpty ? d[0]['TOTAL'].toString() : "0"
  //     //   }));
  //     // });

  //     // ulangtahun.value = hasilSales[2];
  //     isLoadingGrafik.value = false;
  //   } else {
  //     isLoadingGrafik.value = false;
  //     // UtilsAlert.showToast("Data sales tidak di temukan");
  //   }
  // }

  // var isKollek;

  // Future<void> dashboard() async {
  //   // void dashboard() async {
  //   Map<String, dynamic> body = {
  //     'user_id': AppData.informasiLoginUser![0].userId,
  //     'user_akses': AppData.informasiHost![0].username,
  //     'hostname': AppData.informasiHost![0].hostname,
  //     'database':
  //         "${AppData.informasiHost![0].dbname}${tahun.value.toString().substring(2, 4)}${bulan.value}",
  //     'tabel': 'ATTENDANCE',
  //     'type_database': 'transaksi',
  //     "type": 1,
  //     // "id_absen": id.toString(),
  //     'db_master': AppData.informasiHost![0].dbname,
  //   };

  //   print('REQUEST BODY -> dashboard: ${jsonEncode(body)}');

  //   try {
  //     Future<List> infoDashboard = GetDataController().queryGlobal(
  //       body,
  //       "aktifitas/dashboard",
  //     );

  //     var hasilDashboard = await infoDashboard;
  //     print('Check hasilDashboard: $hasilDashboard');
  //     if (hasilDashboard[0] == true) {
  //       List data = hasilDashboard[2];
  //       print('Check data: $data'); // Check data: [{is_kolektor: 1}]
  //       isKollek = data[0]['is_kolektor'];
  //       print('Check isKollek: $isKollek');
  //     } else {
  //       print('Check hasilDashboard: $hasilDashboard');
  //     }
  //   } catch (e) {
  //     print('Error dashboard: $e');
  //   }
  // }

  // void prosesInformasiCabang() async {
  //   print('dashboard.dart / prosesInformasiCabang() ');

  //   var kodeCabang = AppData.informasiUserAkses![0].kodeCabang;
  //   Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //   String hasilPeriode = await getPeriode;

  //   if (kodeCabang == "") {
  //     print('masuk kodecabang kosong ');
  //     Map<String, dynamic> body = {
  //       'user_akses': AppData.informasiHost![0].username,
  //       'hostname': AppData.informasiHost![0].hostname,
  //       'database': AppData.informasiHost![0].dbname,
  //       'type_database': "",
  //       'database_periode1': hasilPeriode,
  //       'tabel': "CABANG",
  //     };

  //     Future<List> infoCabang = GetDataController().queryGlobal(
  //       body,
  //       "all_cabang",
  //     );

  //     List hasilCabang = await infoCabang;
  //     if (hasilCabang[0] == true) {
  //       print('isi hasilCabang[2] ${hasilCabang[2]}');

  //       listCabang.value = hasilCabang[2];

  //       listCabang.value.add({
  //         "KODE": "",
  //         "NAMA": "SEMUA",
  //         "ALAMAT1": "SEMUA",
  //         "KETULTAH": "",
  //       });

  //       print("data cabang ${listCabang.value}");

  //       listCabang.refresh();

  //       var getFirst = listCabang.value.first;

  //       kodeCabangSelected.value = "";
  //       kodeCabangSelected.refresh();
  //       namaCabangSelected.value = "SEMUA";
  //       namaCabangSelected.refresh();
  //       alamat1CabangSelected.value = "SEMUA";
  //       alamat1CabangSelected.refresh();
  //       keteranganUlangtahun.value = "";
  //     }
  //   } else {
  //     print('masuk kodecabang tidak kosong ');

  //     print(
  //       'isi AppData.informasiHost[0] ${AppData.informasiHost![0].toJson()}',
  //     );

  //     print(
  //       'isi AppData.informasiUserAkses[0] ${AppData.informasiUserAkses![0].toJson()}',
  //     );

  //     Future<String> getPeriode = GlobalController().prosesGetPeriode();
  //     String hasilPeriode = await getPeriode;
  //     Map<String, dynamic> body = {
  //       'user_akses': AppData.informasiHost![0].username,
  //       'hostname': AppData.informasiHost![0].hostname,
  //       'database': AppData.informasiHost![0].dbname,
  //       'tabel': "CABANG",
  //       'type': 1,
  //       'column1': "KODE",
  //       'cari1': AppData.informasiUserAkses![0].kodeCabang,
  //       'database_periode1': hasilPeriode,
  //     };
  //     Future<List> infoCabang = GetDataController().queryGlobal(
  //       body,
  //       "informasi_cabang",
  //     );
  //     List hasilCabang = await infoCabang;
  //     if (hasilCabang[0] == true) {
  //       listCabang.value = hasilCabang[2];
  //       listCabang.refresh();
  //       kodeCabangSelected.value = listCabang[0]["KODE"];
  //       kodeCabangSelected.refresh();
  //       namaCabangSelected.value = listCabang[0]["NAMA"];
  //       namaCabangSelected.refresh();
  //       alamat1CabangSelected.value = listCabang[0]["ALAMAT1"];
  //       keteranganUlangtahun.value = listCabang[0]['KETULTAH'];
  //     }
  //   }
  // }

  // void routeMenu(menu) {
  //   Get.back();
  //   if (menu == "Order Penjualan") {
  //     Get.to(SalesOrderMain());
  //     // SalesOrderMainController().startLoad();
  //   } else if (menu == "Kontrol Stok Sales") {
  //     Get.to(KontrolStokSales());
  //   } else if (menu == "Kontrol Piutang") {
  //     Get.to(KontrolPiutangViewData());
  //   } else if (menu == "Laporan Order") {
  //     Get.to(ListLaporanOrder());
  //   } else if (menu == "Laporan Penjualan") {
  //     Get.to(ListLaporanPenjualan());
  //   } else if (menu == "Laporan Pengiriman") {
  //     Get.to(ListLaporanPengirimanBarang());
  //   } else if (menu == "Laporan Sales Aktivity") {
  //     Get.to(SalesActivityLaporanAbsensi());
  //   } else if (menu == "Master Paket") {
  //     Get.to(ListMasterPaket());
  //   } else if (menu == "Lebih Detail") {
  //     bottomshetDetailMenu();
  //   } else if (menu == "Master Pelanggan") {
  //     Get.to(CustomerPage());
  //   } else if (menu == "Stok Opname") {
  //     Get.to(StokOpnameMain());
  //   }
  // }

  // void resetData() {
  //   salesmanCode.value = salesmanCodeDefault.value;
  //   salesManName.value = salesManNameDefault.value;
  //   tahun.value = DateTime.now().year.toString().toString();
  //   bulan.value = DateTime.now().month.toString().padLeft(2, '0').toString();
  //   bulanString.value = "${DateFormat('MMMM').format(DateTime.now())}";
  // }

  // void clearSessionLogin() {}

  // Future<void> clearSession() async {
  //   kodeCabangSelected.value = "";
  //   salesmanCode.value = "2";

  //   UtilsAlert.showLoadingIndicator(Get.context!, "Tunggu  Sebentar");
  //   Map<String, dynamic> body = {
  //     'time': DateTime.now().toString(),
  //     'email': AppData.emailDevice,
  //   };
  //   var connect = Api.connectionApi("post", body, "validasi_logout");

  //   var getValue = await connect;
  //   var valueBody = jsonDecode(getValue.body);
  //   List dataFinal = [];
  //   if (valueBody['status'] == true) {
  //     AppData.informasiHost = null;
  //     AppData.informasiLoginUser = null;
  //     AppData.informasiUserAkses = null;
  //     AppData.aksesToken = "";
  //     Get.back();

  //     Get.offAll(Login());
  //   } else {
  //     Get.back();

  //     UtilsAlert.showToast(valueBody['message']);
  //   }
  // }

  // void bottomshetDetailMenu() {
  //   showModalBottomSheet<String>(
  //     context: Get.context!,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(6.0)),
  //     ),
  //     builder: (context) {
  //       bool statusCari = false;
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setState) {
  //           return MediaQuery(
  //             data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
  //             child: SafeArea(
  //               child: Padding(
  //                 padding: EdgeInsets.only(
  //                   left: 16,
  //                   right: 16,
  //                   bottom: MediaQuery.of(context).viewInsets.bottom,
  //                 ),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Container(
  //                       child: Row(
  //                         children: [
  //                           Expanded(
  //                             flex: 15,
  //                             child: Icon(
  //                               Iconsax.element_equal,
  //                               color: Utility.primaryDefault,
  //                             ),
  //                           ),
  //                           Expanded(
  //                             flex: 80,
  //                             child: TextLabell(
  //                               text: "Semua menu",
  //                               size: 16,
  //                               weight: FontWeight.bold,
  //                               color: Utility.blackGlobal,
  //                             ),
  //                           ),
  //                           Expanded(
  //                             flex: 10,
  //                             child: InkWell(
  //                               onTap: () {
  //                                 Get.back();
  //                               },
  //                               child: Icon(Icons.close),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(height: 10),
  //                     Divider(),
  //                     SizedBox(height: 10),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
}
