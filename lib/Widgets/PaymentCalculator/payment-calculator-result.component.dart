import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/DatabaseHelper.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:sqflite/sqflite.dart';
import '../../Models/payment-calculator-result.dart';

class PaymentCalculatorResultComponent extends StatefulWidget {
  static const String routeName = '/readOrEditLoan';

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
    final _titleController =
        TextEditingController(text: paymentCalculatorResult.title.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Your data'),
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
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                              'Provide a description. You will find it in your collection.'),
                          titleTextStyle:
                              TextStyle(color: Colors.black87, fontSize: 16),
                          content: TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                                filled: true,
                                border: const OutlineInputBorder(),
                                labelText: 'Description',
                                hintText: '5/57 Laidlaw Parade, East Brisbane',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black38)),
                          ),
                          actions: [
                            ElevatedButton(
                              child: Text('Save'),
                              onPressed: () {
                                paymentCalculatorResult.title =
                                    _titleController.text;
                                insertPaymentCalculatorResult(
                                    paymentCalculatorResult);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: _titleController.text,
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' saved in your collection',
                                      ),
                                    ],
                                  ),
                                )));
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 64.0, right: 64.0),
                  child: Text('Save'),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.paymentCalculator);
        },
        child: const Icon(Icons.edit),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Define a function that inserts dogs into the database
  Future<int> insertPaymentCalculatorResult(
      PaymentCalculatorResult paymentCalculatorResult) async {
    var db = await dbHelper.database;

    return await db.insert(
      'userLoanRecords',
      paymentCalculatorResult.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
