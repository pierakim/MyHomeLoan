import 'package:flutter/cupertino.dart';

class PaymentResult extends ChangeNotifier {
  double mortgageValue = 0;
  double transferFeeValue = 0;

  double get result => mortgageValue + transferFeeValue;

  PaymentResult(
    this.mortgageValue,
    this.transferFeeValue,
  );
}
