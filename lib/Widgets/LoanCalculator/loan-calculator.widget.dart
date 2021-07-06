import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';

import '../app-drawer.widget.dart';
import 'loan-calculator-card.widget.dart';

class LoanCalculatorWidget extends StatefulWidget {
  // ROUTE NAME
  static const String routeName = '/loanCalculator';

  LoanCalculatorWidget({Key key}) : super(key: key);

  @override
  _LoanCalculatorWidgetState createState() => _LoanCalculatorWidgetState();
}

class _LoanCalculatorWidgetState extends State<LoanCalculatorWidget> {
  Future<LoanCalculatorResultScreenArgumentsModel> _loanCalculatorResultScreenArgumentsModel;

  @override
  void initState() {
    super.initState();
    _loanCalculatorResultScreenArgumentsModel = getModelData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LoanCalculatorResultScreenArgumentsModel>(
      future: _loanCalculatorResultScreenArgumentsModel, // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<LoanCalculatorResultScreenArgumentsModel> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return Scaffold(
                appBar: AppBar(title: Text(snapshot.data.isInEditMode ? "Edit your data" : "Loan Calculator")),
                drawer: snapshot.data != null && !snapshot.data.isInEditMode ? AppDrawerWidget() : null,
                body: LoanCalculatorCardWidget(
                  loanCalculatorResultScreenArgumentsModelParam: snapshot.data,
                ));
        }
      },
    );
  }

  Future<LoanCalculatorResultScreenArgumentsModel> getModelData() async {
    LoanCalculatorResultScreenArgumentsModel arguments;
    await Future.delayed(Duration.zero, () {
      // From the AppDrawerWidget initialisation the value
      arguments = ModalRoute.of(context).settings.arguments;
    });
    return Future.value(arguments); // return your response
  }
}
