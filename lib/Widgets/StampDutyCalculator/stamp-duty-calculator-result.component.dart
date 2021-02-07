import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/stamp-duty-calculator-result.dart';

class StampDutyCalculatorResultComponent extends StatefulWidget {
  StampDutyCalculatorResultComponent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _StampDutyCalculatorResultComponentState();
}

class _StampDutyCalculatorResultComponentState
    extends State<StampDutyCalculatorResultComponent> {
  @override
  Widget build(BuildContext context) {
    final StampDutyCalculatorResult args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit your data'),
        ),
        body: Column(
          children: <Widget>[
            Text(args.result.toString()),
            Text(args.state.toString()),
          ],
        ));
  }
}
