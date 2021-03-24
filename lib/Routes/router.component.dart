import 'package:flutter/material.dart';
import 'package:my_home_loan/Widgets/MyCollection/MyCollectionComponent.dart';
import 'package:my_home_loan/Widgets/PaymentCalculator/payment-calculator.component.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator-result.component.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator.component.dart';

import '../Widgets/PaymentCalculator/payment-calculator-result.component.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  if (settings.name == Routes.paymentCalculator) {
    return _buildRoute(settings, PaymentCalculatorComponent());
  }

  if (settings.name == Routes.myCollection) {
    return _buildRoute(settings, MyCollectionComponent());
  }

  if (settings.name == Routes.stampDutyCalculator) {
    return _buildRoute(settings, StampDutyCalculatorComponent());
  }

  if (settings.name == Routes.stampDutyCalculatorResult) {
    return _buildRoute(settings, StampDutyCalculatorResultComponent());
  }

  if (settings.name == Routes.paymentCalculator) {
    return _buildRoute(settings, PaymentCalculatorComponent());
  }

  if (settings.name == Routes.readOrEditLoan) {
    return _buildRoute(settings, PaymentCalculatorResultComponent());
  }

  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}

class Routes {
  static const String paymentCalculator = PaymentCalculatorComponent.routeName;
  static const String myCollection = MyCollectionComponent.routeName;
  static const String stampDutyCalculator =
      StampDutyCalculatorComponent.routeName;
  static const String readOrEditLoan =
      PaymentCalculatorResultComponent.routeName;
  static const String stampDutyCalculatorResult =
      StampDutyCalculatorResultComponent.routeName;
}
