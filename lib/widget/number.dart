import 'package:intl/intl.dart';

String formatPriceWithCommas(int price) {
  final formatter = NumberFormat('#,###', 'en_US');
  return formatter.format(price);
}
