import 'package:intl/intl.dart';

class Utils {
  formatCurrency(value) {
    var formattedNumber =
        NumberFormat("#,###.00", "en_US").format(double.parse(value));
    var result = formattedNumber.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}'");

    return result;
  }
}
