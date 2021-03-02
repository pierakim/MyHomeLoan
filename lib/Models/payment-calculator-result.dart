import 'package:flutter/cupertino.dart';

class PaymentCalculatorResult extends ChangeNotifier {
  String title = '';
  double value01 = 0.0;
  double value02 = 0.0;

  double get result => value01 + value02;

  PaymentCalculatorResult(
    this.title,
    this.value01,
    this.value02,
  );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'value01': value01,
      'value02': value02,
      'result': result
    };
  }
}
