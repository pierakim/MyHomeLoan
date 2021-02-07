import 'package:flutter/material.dart';

import 'Routes/router.component.dart';
import 'Widgets/PaymentCalculator/payment-calculator.component.dart';
import 'Widgets/StampDutyCalculator/stamp-duty-calculator.component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calculate)),
                Tab(icon: Icon(Icons.calculate)),
                Tab(icon: Icon(Icons.calculate)),
              ],
            ),
            title: Text('My Home Loan'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              PaymentCalculatorComponent(),
              StampDutyCalculatorComponent(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
