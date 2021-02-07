import 'package:flutter/cupertino.dart';

class StampDutyCalculatorResult extends ChangeNotifier {
  double propertyValue = 0;
  String state;

  double get result => propertyValue;

  StampDutyCalculatorResult(
    this.propertyValue,
    this.state,
  );
}
