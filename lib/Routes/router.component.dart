import 'package:flutter/material.dart';
import 'package:my_home_loan/Widgets/MyCollection/my-collection.widget.dart';
import 'package:my_home_loan/Widgets/PaymentCalculator/loan-calculator.widget.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator-result.widget.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator.widget.dart';

import '../Widgets/PaymentCalculator/loan-calculator-result.widget.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  if (settings.name == Routes.loanCalculatorWidget) {
    return _buildRoute(settings, LoanCalculatorWidget());
  }

  if (settings.name == Routes.myCollection) {
    return _buildRoute(settings, MyCollectionWidget());
  }

  if (settings.name == Routes.stampDutyCalculator) {
    return _buildRoute(settings, StampDutyCalculatorWidget());
  }

  if (settings.name == Routes.stampDutyCalculatorResult) {
    return _buildRoute(settings, StampDutyCalculatorResultWidget());
  }

  if (settings.name == Routes.readOnlyLoan) {
    return _buildRoute(settings, LoanCalculatorResultWidget());
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
  static const String loanCalculatorWidget = LoanCalculatorWidget.routeName;
  static const String myCollection = MyCollectionWidget.routeName;
  static const String stampDutyCalculator = StampDutyCalculatorWidget.routeName;
  static const String readOnlyLoan = LoanCalculatorResultWidget.routeName;
  static const String stampDutyCalculatorResult = StampDutyCalculatorResultWidget.routeName;
}
