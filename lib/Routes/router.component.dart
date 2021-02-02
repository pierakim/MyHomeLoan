import 'package:flutter/material.dart';

import '../Widgets/PaymentCalculator/payment-result.component.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  if (settings.name == '/extractArguments') {
    return _buildRoute(settings, new PaymentResultComponent());
  }

  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}
