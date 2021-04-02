import 'package:flutter/material.dart';
import 'package:my_home_loan/Widgets/LoanCalculator/loan-calculator-result.widget.dart';
import 'package:my_home_loan/Widgets/LoanCalculator/loan-calculator.widget.dart';
import 'package:my_home_loan/Widgets/MyCollection/my-collection.widget.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator-result.widget.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator.widget.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  if (settings.name == Routes.loanCalculatorWidget) {
    return _buildRoute(settings, LoanCalculatorWidget());
  }

  if (settings.name == Routes.loanCalculatorResultWidget) {
    return _buildRoute(settings, LoanCalculatorResultWidget());
  }

  if (settings.name == Routes.stampDutyCalculatorWidget) {
    return _buildRoute(settings, StampDutyCalculatorWidget());
  }

  if (settings.name == Routes.stampDutyCalculatorResultWidget) {
    return _buildRoute(settings, StampDutyCalculatorResultWidget());
  }

  if (settings.name == Routes.myCollectionWidget) {
    return _buildRoute(settings, MyCollectionWidget());
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
  static const String loanCalculatorResultWidget = LoanCalculatorResultWidget.routeName;
  static const String stampDutyCalculatorWidget = StampDutyCalculatorWidget.routeName;
  static const String stampDutyCalculatorResultWidget = StampDutyCalculatorResultWidget.routeName;
  static const String myCollectionWidget = MyCollectionWidget.routeName;
}
