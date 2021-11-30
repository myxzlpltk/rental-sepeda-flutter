import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';
import 'package:rental_sepeda_flutter/services/top_up_services.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

import 'app_provider.dart';

class TopUpProvider extends ChangeNotifier {
  final TextEditingController amountController = TextEditingController();
  final currencyTextInputFormatter = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: "Rp. ",
  );
  final List<int> quickAmounts = [10000, 20000, 50000, 100000, 200000, 500000];

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;
  set isProcessing(bool isProcessing) {
    _isProcessing = isProcessing;
    notifyListeners();
  }

  int _amount = 0;
  int get amount => _amount;
  set amount(int amount) {
    _amount = amount;

    String _newValue = currencyTextInputFormatter.format(amount.toString());
    amountController.value = TextEditingValue(
      text: _newValue,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newValue.length),
      ),
    );

    notifyListeners();
  }

  void syncAmount() {
    _amount = currencyTextInputFormatter.getUnformattedValue().toInt();
    notifyListeners();
  }

  void topUp(BuildContext context) async {
    isProcessing = true;

    try {
      final appState = Provider.of<AppProvider>(context, listen: false);
      final user = appState.user!;

      TopUp topUp = TopUp(
        id: "",
        uid: user.id,
        amount: amount,
        createdAt: DateTime.now(),
        status: TopUpStatus.success,
      );

      topUp = await TopUpServices.create(topUp);
      appState.user = await UserServices.update(
        user.copyWith(balance: user.balance + topUp.amount),
      );

      isProcessing = false;

      Navigator.pushReplacementNamed(context, Routes.detailTopUp,
          arguments: topUp.id);
    } catch (e) {
      Fluttertoast.showToast(msg: appError);
      isProcessing = false;
    }
  }
}
