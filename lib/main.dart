import 'package:flutter/material.dart';
import 'package:my_home_loan/Widgets/MyCollection/MyCollectionComponent.dart';

import 'Routes/router.component.dart';
import 'Widgets/MyCollection/MyCollectionComponent.dart';
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
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[600],
        accentColor: Colors.cyan[600],
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'YOUR LOAN', icon: Icon(Icons.calculate)),
                Tab(text: 'STAMP DUTY', icon: Icon(Icons.calculate)),
                Tab(text: 'COLLECTION', icon: Icon(Icons.calculate)),
              ],
            ),
            title: Text(
              'My Oz Loan',
              style: TextStyle(
                  fontFamily: 'Spartan',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              PaymentCalculatorComponent(),
              StampDutyCalculatorComponent(),
              MyCollectionComponent()
            ],
          ),
        ),
      ),
    );
  }
}
