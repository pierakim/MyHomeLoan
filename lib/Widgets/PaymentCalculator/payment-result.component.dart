import 'package:flutter/material.dart';

import '../../Models/HomeLoanDatarResult.dart';

class PaymentResultComponent extends StatefulWidget {
  PaymentResultComponent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentResultComponentState();
}

class _PaymentResultComponentState extends State<PaymentResultComponent> {
  @override
  Widget build(BuildContext context) {
    final PaymentResult args = ModalRoute.of(context).settings.arguments;

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
