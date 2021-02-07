import 'package:flutter/cupertino.dart';

class StampDutyCalculatorResult extends ChangeNotifier {
  double propertyValue = 0;
  String state;
  int propertyChoice = 0;
  int isFirstHomeBuyer = 0;

  double get result => propertyValue;

  StampDutyCalculatorResult(this.propertyValue, this.state, this.propertyChoice,
      this.isFirstHomeBuyer);
}
