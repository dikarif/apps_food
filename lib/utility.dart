import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class Utility {
  //Images
  final siscomLogo = 'assets/siscom_logo.png';
  // COLOR
  // static Color baseColor = HexColor('#9F0B24');
  static Color baseColor = HexColor('#59c7ea');
  static Color baseColor1 = Color(0xff11151e);
  static Color baseColor2 = Color(0xffffffff);

  // static Color primaryDefault = Color(0xff9F0B24);
  static Color primaryDefault = Colors.orangeAccent; //HexColor('#59c7ea');
  static Color primaryLight = Color(0xffE17B66);
  static Color primaryLight50 = Color(0xffFFEDE3);
  static Color primaryLight200 = HexColor('#F5B39B');
  static const colorNeutralFgTertiary = Color(0xFFa9b9cc);
  static Color primaryBg1 = HexColor('#FFEDEC');
  // static Color primaryBg1 = Color.fromARGB(80, 255, 71, 61);
  static const colorBorderMinimal = Color(0xFFCBD5E0);
  static const colorNeutralBorderPrimary = Color(0xFFCBD5E0);
  static Color nonAktif = Color(0xff868FA0);
  static Color greyLight300 = Color(0xffBCC2CE);
  static Color greyLight100 = Color(0xffE9EDF5);
  static Color greyLight50 = Color(0xffF8FAFF);
  static Color grey100 = Color(0xffE9EDF5);
  static Color grey600 = Color(0xff687182);
  static Color grey900 = Color(0xff333B4A);
  static Color greyDark = Color(0xff333B4A);
  static Color greyDark700 = Color(0xff5A6376);
  static Color greyDefault = Color(0xff868FA0);
  static Color border = HexColor('#CBD5E0');
  static Color borderSoft = HexColor('#E2E8F0');

  static Color secondary = HexColor('#68778D');

  static Color infoLigh50 = Color(0xffE9F5FE);
  static Color infoLigh200 = HexColor('#ACD9FD');
  static Color infoDark600 = Color(0xff2263CB);
  static Color infoDark = Color(0xff2263CB);
  static Color infoDar900 = Color(0xff092371);

  static Color suskesLight50 = Color(0xffE6FCE6);

  static Color warningLight50 = Color(0xffFEF9E6);
  static Color warningLight200 = Color(0xffFDE89D);
  static Color warningDark700 = Color(0xffAE6E06);

  static Color successLight50 = Color(0xffE6FCE6);
  static Color successLight200 = Color(0xff9FF7AA);
  static Color successDark600 = Color(0xff0E9856);

  static Color errorLight = Color(0xffFFE7D8);
  static Color succesLight = Color(0xffE6FCE6);
  static Color succesLight100 = HexColor('#CEFBCF');
  static Color borderContainer = Color.fromARGB(255, 211, 205, 205);
  static Color shadowColor = Color.fromARGB(
    255,
    190,
    190,
    190,
  ).withOpacity(0.3);

  static Color sh = Color.fromARGB(255, 190, 190, 190).withOpacity(0.3);

  static Color black = HexColor('#0F0C0C');
  static Color blue = HexColor('2F80ED');
  static Color blueLight = HexColor("#E9F5FE");

  static Color red = HexColor('#9F0B24');
  static Color redLight = HexColor('#FFEDE3');
  static Color radius = HexColor('#FFEDE3');
  static Color green = HexColor('#14B156');
  static Color greenLight = HexColor('#FFEDE3');
  static Color greyLight400 = HexColor('#A1A9B8');

  static Color blackGlobal = HexColor('#202327');

  static Color greyLight200 = HexColor('#D5DBE5');
  static Color color_state_on_danger_bg = HexColor('#7A0B2B');
  static Color color_state_danger_bg = HexColor('#FFF2EB');
  static Color color_state_danger = HexColor('#FF463D');
  static Color color_state_danger_border = HexColor('#FFA38A');

  // SIZE
  static double verySmall = 8.0;
  static double small = 10.0;
  static double normal = 12.0;
  static double semiMedium = 14.0;
  static double medium = 16.0;
  static double large = 20.0;
  static double extraLarge = 30.0;

  //version app
  static String versionApp = '2026.02.20';

  // BORDER RADIUS
  static BorderRadius borderStyle1 = BorderRadius.only(
    topLeft: Radius.circular(6),
    topRight: Radius.circular(6),
    bottomLeft: Radius.circular(6),
    bottomRight: Radius.circular(6),
  );

  static BorderRadius borderStyle2 = BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(8),
    bottomLeft: Radius.circular(8),
    bottomRight: Radius.circular(8),
  );

  static BorderRadius borderStyle3 = BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  );

  static BorderRadius borderStyle4 = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
    bottomLeft: Radius.circular(16),
    bottomRight: Radius.circular(16),
  );

  static BorderRadius borderStyle5 = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
    bottomLeft: Radius.circular(24),
    bottomRight: Radius.circular(24),
  );

  // TEXT CUSTOM

  static TextStyle judulList = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: primaryDefault,
  );

  static TextStyle isiList = TextStyle(fontSize: normal, color: nonAktif);

  // CONVERT DATE

  static String convertDate(String date) {
    DateTime convert = DateTime.parse(date);
    var hari = DateFormat('EEEE');
    var tanggal = DateFormat('dd-MM-yyyy');
    var convertHari = hari.format(convert);
    var hasilConvertHari = hariIndo(convertHari);
    var valid2 = tanggal.format(convert);
    var validFinal = "$hasilConvertHari, $valid2";
    return validFinal;
  }

  static String convertDate1(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd-MM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String convertDate2(String date) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String convertDate3(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('MMMM yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String convertDate4(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String convertDate5(String date) {
    var inputFormat = DateFormat('dd MMMM yyyy');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String convertDate6(String date) {
    var outputDate = DateFormat(
      'dd-MM-yyyy',
    ).format(DateTime.parse(date.toString()));
    return outputDate;
  }

  static String convertDate7(String date) {
    DateTime convert = DateTime.parse(date);
    var hari = DateFormat('EEEE');
    var tanggal = DateFormat('dd MMM yyyy');
    var convertHari = hari.format(convert);
    var hasilConvertHari = hariIndo(convertHari);
    var valid2 = tanggal.format(convert);
    var validFinal = "$hasilConvertHari, $valid2";
    return validFinal;
  }

  static String bulanNumberNow(DateTime tanggalNow) {
    String bulanPeriode = "${DateFormat('MM').format(tanggalNow)}";
    return bulanPeriode;
  }

  static String bulanStringNow() {
    String bulanPeriode = "${DateFormat('MMM').format(DateTime.now())}";
    return bulanPeriode;
  }

  static String bulanStringNow2() {
    String bulanPeriode = "${DateFormat('MMMM').format(DateTime.now())}";
    return bulanPeriode;
  }

  static String tahunNow(DateTime tanggalNow) {
    String tahunPeriode = "${DateFormat('y').format(tanggalNow)}";
    return tahunPeriode;
  }

  static String getDateTime(String dateFromServer) {
    dateFromServer = dateFromServer.replaceAll(" ", "");
    dateFromServer = dateFromServer.replaceAll("T", " ");
    return dateFromServer;
  }

  static bool validasiBeforeDate(DateTime startDate, DateTime endDate) {
    return startDate.isBefore(endDate);
  }

  static bool validasiAfterDate(DateTime startDate, DateTime endDate) {
    return startDate.isAfter(endDate);
  }

  static String convertNoFaktur(String nofaktur) {
    var getPolaType = nofaktur.substring(0, 2);
    var getTahun = nofaktur.substring(2, 6);
    var getBulan = nofaktur.substring(6, 8);
    var getNomor = nofaktur.substring(8, 12);
    return "$getPolaType-$getTahun/$getBulan-$getNomor";
  }

  static String convertNoFakturBuatOrderPenjualan(String nofaktur) {
    var getPolaType = nofaktur.substring(0, 2);
    var getTahun = nofaktur.substring(2, 6);
    var getBulan = nofaktur.substring(6, 8);
    return "$getPolaType-$getTahun/$getBulan-xxxx";
  }

  static double hitungTotalPembelianBarang(
    String hargaBarang,
    String qtyBeli,
    String discd,
  ) {
    var hitung = double.parse(discd) * double.parse(qtyBeli);
    var hitung2 = double.parse(hargaBarang) * double.parse(qtyBeli);
    var hitungFinal = hitung2 - hitung;
    return hitungFinal;
  }

  static double persenDiskonHeader(String subtotal, String nominalDiskon) {
    var hitung = (double.parse(nominalDiskon) / double.parse(subtotal)) * 100;
    return hitung;
  }

  static double nominalDiskonHeader(String subtotal, String persenDiskon) {
    var hitung = (double.parse(subtotal) * double.parse(persenDiskon)) / 100;
    return hitung;
  }

  static double nominalPpn(String subtotal, String persenDiskon, String bonus) {
    var hitung =
        ((double.parse(subtotal) - double.parse(bonus)) *
            double.parse(persenDiskon)) /
        100;
    return hitung;
  }

  static double nominalPpnNew(
    String subtiotal,
    String persenDiskon,
    String bonus,
    String chkdpp,
    String disch,
    String discd,
  ) {
    // var hitung = ((double.parse(subtotal) - double.parse(bonus)) *
    //         double.parse(persenDiskon)) /
    //     100;
    var total = 0.0;
    // if (chkdpp.toString() == "1") {
    //   total = ((double.parse(subtiotal) - double.parse(bonus)) * 11) / 12;
    // } else {
    //   total = ((double.parse(subtiotal) - double.parse(bonus)));
    // }
    //  var hitung =
    //     (double.parse(total.toString()) * ((double.parse(p ersenDiskon) / 100)));

    if (chkdpp == "1") {
      total =
          (((double.parse(subtiotal) + double.parse(discd)) -
                  double.parse(disch) -
                  double.parse(discd)) /
              1.11) *
          11 /
          12;
    } else {
      total =
          ((double.parse(subtiotal) -
          double.parse(disch) -
          double.parse(discd)));
    }
    if (total == "" || total == null || total == "null") {
      total = 0;
    }

    var hitung = (double.parse(persenDiskon) / 100) * total;
    return hitung;
  }

  static double nominalPpnharga(String harga, ppn) {
    // var hitung = ((double.parse(subtotal) - double.parse(bonus)) *
    //         double.parse(persenDiskon)) /
    //     100;
    var total = 0.0;
    total = (double.parse(ppn) / 100) * double.parse(harga);

    return total;
  }

  static double nominalPPNHeader(String subtotal, String ppnHeader) {
    var hitung = (double.parse(subtotal) * double.parse(ppnHeader)) / 100;
    return hitung;
  }

  static double nominalServiceCharge(String subtotal, String serviceCharge) {
    var hitung = (double.parse(subtotal) * double.parse(serviceCharge)) / 100;
    return hitung;
  }

  static double nominalPPNHeaderView(
    String subtotal,
    String diskonHeader,
    String ppnHeader,
  ) {
    var hitung = (double.parse(subtotal) * double.parse(diskonHeader)) / 100;
    var hitung1 = double.parse(subtotal) - hitung;
    var hitung2 = (hitung1 * double.parse(ppnHeader)) / 100;
    return hitung2;
  }

  static double nominalServiceChargeView(
    String subtotal,
    String diskonHeader,
    String serviceCharge,
  ) {
    var hitung = (double.parse(subtotal) * double.parse(diskonHeader)) / 100;
    var hitung1 = double.parse(subtotal) - hitung;
    var hitung2 = (hitung1 * double.parse(serviceCharge)) / 100;
    return hitung2;
  }

  static double hitungDetailTotalPos(
    String subtotal,
    String diskon,
    String ppn,
    String serviceCharge,
  ) {
    var fltr1 = (double.parse(subtotal) * double.parse(diskon)) / 100;
    var fltr2 = double.parse(subtotal) - fltr1;
    var nominalDiskon = fltr1;

    var fltr3 = (fltr2 * double.parse(ppn)) / 100;
    var nominalPpn = fltr3;

    var fltr5 = (fltr2 * double.parse(serviceCharge)) / 100;
    var nominalService = fltr5;

    var nominalFinal =
        double.parse(subtotal) - nominalDiskon + nominalPpn + nominalService;

    return nominalFinal;
  }

  static double perhitunganSisa(double limit, double outsValue, double netto) {
    var hitung = limit - (outsValue) - (netto);
    return hitung;
  }

  static double perhitunganOutsPiutang(double outsValue, double netto) {
    var hitung = outsValue + netto;
    return hitung;
  }

  static double hitungNettoOrderPenjualan(
    String subtotal,
    String ppn,
    String pembulatan,
  ) {
    // var hitung = (double.parse(subtotal) * double.parse(ppn)) / 100;
    // var hasilAkhir = double.parse(subtotal) + hitung + double.parse(pembulatan);
    var hitung = 0;
    var hasilAkhir = double.parse(subtotal) + hitung;
    return hasilAkhir;
  }

  static int validasiValueint(String value) {
    var vld1 = value.replaceAll(",", "");
    var vld2 = vld1.replaceAll(".", "");
    var val3 = int.parse(vld2);
    return val3;
  }

  static double validasiValueDouble(String value) {
    var vld1 = value.replaceAll(",", ".");
    var vld2 = vld1.replaceAll(".", ".");
    var val3 = double.parse(
      vld2.trim() == "" || vld2.trim() == "null" ? "0.0" : vld2,
    );
    return val3;
  }

  static double convertStringRpToDouble(String value) {
    var filter1 = value.replaceAll("Rp", "");
    var filter2 = filter1.replaceAll(" ", "");
    var filter3 = filter2.replaceAll(".", "");
    var filter4 = filter3.replaceAll(",", ".");
    var valueFinal = double.parse(filter4);
    return valueFinal;
  }

  static int pengurangan(String value1, String value2) {
    var filter1 = int.parse(value1);
    var filter2 = int.parse(value2);
    var pengurangan = filter1 - filter2;
    return pengurangan;
  }

  static String rupiahFormat(String nominal, String type) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 2,
    );
    NumberFormat currencyFormatterRp = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    if (normal == "" || nominal == null || nominal == "null") {
      nominal = "0";
    }
    String hasilFinal = "";
    if (type == "with_rp") {
      hasilFinal = currencyFormatterRp.format(double.parse(nominal));
    } else {
      hasilFinal = currencyFormatter.format(double.parse(nominal));
    }
    return hasilFinal;
  }

  static String dppCalculation(
    String type,
    String hrgtot,
    String disch,
    String discd,
  ) {
    // var total = '0';
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 2,
    );
    NumberFormat currencyFormatterRp = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );

    print('hrgtot ${hrgtot}');
    print('DISCD TOTAL ${discd}');
    var total = 0.0;

    // if (type == "1") {
    //   total = ((double.parse(hrgtot) - double.parse(paket)) * 11) / 12;
    // } else {
    //   total = ((double.parse(hrgtot) - double.parse(paket)));
    // }
    // if (total == "" || total == null || total == "null") {
    //   total = 0;
    // }

    if (type == "1") {
      total =
          (((double.parse(hrgtot) + double.parse(discd)) -
                  double.parse(disch) -
                  double.parse(discd)) /
              1.11) *
          11 /
          12;
    } else {
      total =
          ((double.parse(hrgtot) - double.parse(disch) - double.parse(discd)));
    }
    if (total == "" || total == null || total == "null") {
      total = 0;
    }

    String hasilFinal = "";
    hasilFinal = currencyFormatterRp.format(double.parse(total.toString()));
    // if (type == "with_rp") {
    //   hasilFinal = currencyFormatterRp.format(double.parse(total.toString()));
    // } else {
    //   hasilFinal = currencyFormatter.format(double.parse(total.toString()));
    // }
    return hasilFinal;
  }

  // SETTING

  static String hariIndo(String hari) {
    if (hari == "Monday") {
      hari = "Senin";
    } else if (hari == "Tuesday") {
      hari = "Selasa";
    } else if (hari == "Wednesday") {
      hari = "Rabu";
    } else if (hari == "Thursday") {
      hari = "Kamis";
    } else if (hari == "Friday") {
      hari = "Jumat";
    } else if (hari == "Saturday") {
      hari = "Sabtu";
    } else if (hari == "Sunday") {
      hari = "Minggu";
    } else {
      hari = hari;
    }
    return hari;
  }

  static Widget infoContainer(String title) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#E9F5FE'),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(Iconsax.info_circle5, color: Color(0xff001767), size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                color: HexColor('#68778D'),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
