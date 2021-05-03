import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';
import 'package:my_home_loan/Routes/router.component.dart';
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
  bool _inEditMode = false;

  @override
  void initState() {
    // https://stackoverflow.com/a/59881577
    // Accesssing the context to get the arguments (if needed) from the route here.
    super.initState();

    Future.delayed(Duration.zero, () {
      LoanCalculatorResultScreenArgumentsModel screenArguments = ModalRoute.of(context).settings.arguments;
      if (screenArguments.loanCalculatorResultModel != null) {
        print("EXISTING LOAN");
        setState(() {
          this._inEditMode = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WIDGET
    return Scaffold(
        appBar: AppBar(title: Text(this._inEditMode ? "Edit your data" : "Loan Calculator")),
        drawer: !_inEditMode ? AppDrawerWidget() : null,
        body: LoanCalculatorCardWidget());
  }
}
