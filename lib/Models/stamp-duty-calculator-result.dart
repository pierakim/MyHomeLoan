import 'package:flutter/cupertino.dart';

class StampDutyCalculatorResult extends ChangeNotifier {
  double propertyValue = 0;
  String state;
  int propertyChoice = 0;
  int isFirstHomeBuyer = 0;

  double get result => queenslandResult();

  StampDutyCalculatorResult(this.propertyValue, this.state, this.propertyChoice,
      this.isFirstHomeBuyer);
}

double queenslandResult() {
  return 10.0;
}
