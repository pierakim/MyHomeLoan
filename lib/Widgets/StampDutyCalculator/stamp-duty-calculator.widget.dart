import 'package:flutter/material.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator-card.widget.dart';
import '../app-drawer.widget.dart';

/// This is the stateful widget that the main application instantiates.
class StampDutyCalculatorWidget extends StatefulWidget {
  static const String routeName = '/stampDutyCalculator';

  StampDutyCalculatorWidget({Key key}) : super(key: key);

  @override
  _StampDutyCalculatorWidgetState createState() => _StampDutyCalculatorWidgetState();
}

class _StampDutyCalculatorWidgetState extends State<StampDutyCalculatorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text("Stamp duty calculator"),
            ),
            drawer: AppDrawerWidget(),
            body: StampDutyCalculatorCardWidget()));
  }
}
