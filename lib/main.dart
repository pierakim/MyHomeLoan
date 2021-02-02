import 'package:flutter/material.dart';

import 'Routes/router.component.dart';
import 'Widgets/PaymentCalculator/payment-calculator.component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Your home loan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getRoute,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: PaymentCalculatorComponent(),
      ),
    );
  }
}
