import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/* Methods helper */
final _formatCurrency = NumberFormat.currency(
  locale: "id_ID",
  symbol: "Rp. ",
  decimalDigits: 0,
);

String toIDR(int money) {
  return _formatCurrency.format(money);
}

final phoneNumberMask = MaskTextInputFormatter(mask: '+62 ###-####-#####');
