import 'package:intl/intl.dart';

/* Methods helper */
final _formatCurrency = NumberFormat.currency(
  locale: "id_ID",
  symbol: "Rp. ",
  decimalDigits: 0,
);

String toIDR(int money) {
  return _formatCurrency.format(money);
}
