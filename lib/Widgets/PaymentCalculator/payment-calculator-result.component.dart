import 'package:flutter/material.dart';

import '../../Models/payment-calculator-result.dart';

class PaymentCalculatorResultComponent extends StatefulWidget {
  PaymentCalculatorResultComponent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _PaymentCalculatorResultComponentState();
}

class _PaymentCalculatorResultComponentState
    extends State<PaymentCalculatorResultComponent> {
  @override
  Widget build(BuildContext context) {
    final PaymentCalculatorResult args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit your data'),
        ),
        body: Column(
          children: <Widget>[
            Text(args.result.toString()),
          ],
        ));
  }
}
