import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

import '../../Models/payment-calculator-result.dart';

class PaymentCalculatorResultComponent extends StatefulWidget {
  PaymentCalculatorResultComponent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _PaymentCalculatorResultComponentState();
}

class _PaymentCalculatorResultComponentState
    extends State<PaymentCalculatorResultComponent> {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    final PaymentCalculatorResult paymentCalculatorResult =
        ModalRoute.of(context).settings.arguments;

    final _value01Controller =
        TextEditingController(text: paymentCalculatorResult.value01.toString());
    final _value02Controller =
        TextEditingController(text: paymentCalculatorResult.value02.toString());
    final _resultController =
        TextEditingController(text: paymentCalculatorResult.result.toString());

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit your data'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.pink,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                      controller: _value01Controller,
                                      decoration: InputDecoration(
                                        prefixText: "\$",
                                        suffixText: ' AUD',
                                        border: InputBorder.none,
                                        filled: false,
                                        labelText: "Value01",
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          )),
                        ),
                        Expanded(
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.not_listed_location_outlined,
                                    color: Colors.pink,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                      controller: _value02Controller,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: false,
                                        labelText: "Value02",
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Text('Result'),
                        subtitle: Text('blablabla blabla bla blablabla'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller: _resultController,
                              decoration: InputDecoration(
                                suffixText: ' AUD',
                                border: InputBorder.none,
                                filled: false,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    insertPaymentCalculatorResult(paymentCalculatorResult);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 64.0, right: 64.0),
                    child: Text('Save'),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  // Define a function that inserts dogs into the database
  Future<void> insertPaymentCalculatorResult(
      PaymentCalculatorResult paymentCalculatorResult) async {
    var db = await dbHelper.database;

    var test = await db.insert(
      'userLoanRecords',
      paymentCalculatorResult.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
