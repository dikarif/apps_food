import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalController extends GetxController {
  String FormatNumber_(num Nilai) {
    var formatter = NumberFormat('#,##,000');
    return (formatter.format(Nilai));
  }
}
