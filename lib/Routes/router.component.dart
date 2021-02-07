import 'package:flutter/material.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator-result.component.dart';

import '../Widgets/PaymentCalculator/payment-calculator-result.component.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  if (settings.name == '/extractArguments') {
    return _buildRoute(settings, new PaymentCalculatorResultComponent());
  }

  if (settings.name == '/stampDutyResult') {
    return _buildRoute(settings, new StampDutyCalculatorResultComponent());
  }

  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}
