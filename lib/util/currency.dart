import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final euroFormat = NumberFormat("#,##0.00", "en_US");

  static String formatToEuro(double amount) {
    return '${euroFormat.format(amount)} €';
  }
}
