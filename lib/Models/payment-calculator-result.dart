import 'package:flutter/cupertino.dart';

class PaymentCalculatorResult extends ChangeNotifier {
  double mortgageValue = 0.0;
  double transferFeeValue = 0.0;

  double get result => mortgageValue + transferFeeValue;

  PaymentCalculatorResult(
    this.mortgageValue,
    this.transferFeeValue,
  );
}
