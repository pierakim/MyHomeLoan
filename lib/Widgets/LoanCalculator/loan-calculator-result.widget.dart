import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/DatabaseHelper.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';
import 'package:sqflite/sqflite.dart';

import '../../Models/LoanCalculator/loan-calculator-result.model.dart';

class LoanCalculatorResultWidget extends StatefulWidget {
  static const String routeName = '/readOnlyLoan';

  LoanCalculatorResultWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoanCalculatorResultWidgetState();
}

class _LoanCalculatorResultWidgetState extends State<LoanCalculatorResultWidget> {
  final dbHelper = DatabaseHelper.instance;

  // STATES
  bool hasResultBeenSaved = false;

  @override
  Widget build(BuildContext context) {
    // ROUTE ARGUMENT
    final LoanCalculatorResultScreenArgumentsModel paymentCalculatorResultScreenArguments = ModalRoute.of(context).settings.arguments;

    // ROUTE PARAMETERS EXTRACTION
    final LoanCalculatorResultModel paymentCalculatorResult = paymentCalculatorResultScreenArguments.loanCalculatorResultModel;
    final bool isBeingCreated = paymentCalculatorResultScreenArguments.isBeingCreated;
    final bool isBeingEdited = paymentCalculatorResultScreenArguments.isBeingEdited;

    // PARAMETERS TO CONTROLLER
    final _paymentCalculatorResultIdController = TextEditingController(text: paymentCalculatorResult.id.toString());
    final _descriptionController = TextEditingController(text: paymentCalculatorResult.title.toString());
    final _value01Controller = TextEditingController(text: paymentCalculatorResult.value01.toString());
    final _value02Controller = TextEditingController(text: paymentCalculatorResult.value02.toString());
    final _resultController = TextEditingController(text: paymentCalculatorResult.result.toString());
    final _titleController = TextEditingController(text: paymentCalculatorResult.title.toString());

    // WIDGET
    return Scaffold(
      appBar: AppBar(title: Text((() {
        if (isBeingCreated && !isBeingEdited) {
          return "Your data";
        } else if (!isBeingCreated && isBeingEdited) {
          return "Back to collection";
        }
      })())),
      body: ListView(
        children: <Widget>[
          // INFORMATION SUMMARY
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  // TITLE ROW
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
                                  Icons.description_outlined,
                                  color: Colors.pink,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _descriptionController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Title",
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
                  // VALUE 01 + VALUE 02 ROW
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
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
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
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
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
          // RESULT SUMMARY
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // RESULT DESCRIPTION
                    const ListTile(
                      title: Text('Result'),
                      subtitle: Text('blablabla blabla bla blablabla'),
                    ),
                    // RESULT VALUE
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
          // SAVE NEW LOAN RESULT - SAVE - SAVED
          if (isBeingCreated && !isBeingEdited)
            if (!hasResultBeenSaved)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    child: Text('Save'),
                    onPressed: () async {
                      paymentCalculatorResult.title = _titleController.text;
                      var hasBeenSaved = await insertPaymentCalculatorResult(paymentCalculatorResult);
                      if (hasBeenSaved) {
                        setState(() => hasBeenSaved == true ? hasResultBeenSaved = true : hasResultBeenSaved = false);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                      }
                    },
                  ),
                ),
              )
            else
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Text('Saved! Go to your collection'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.myCollectionWidget);
                    },
                  ),
                ),
              )
        ],
      ),
      // FLOATINGACTIONBUTTON CONDITIONAL EDIT LOAN RESULT USING
      floatingActionButton: Visibility(
        visible: isBeingCreated ? false : true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.loanCalculatorWidget,
              arguments: new LoanCalculatorResultScreenArgumentsModel(
                  true,
                  false,
                  new LoanCalculatorResultModel(
                      int.parse(_paymentCalculatorResultIdController.value.text),
                      _descriptionController.value.text,
                      double.parse(_value01Controller.value.text) ?? 0.0,
                      double.parse(_value02Controller.value.text) ?? 0.0,
                      0,
                      DateTime.now().toUtc().toString(),
                      DateTime.now().toUtc().toString())),
            );
          },
          child: const Icon(Icons.edit),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  // DEFINE A FUNCTION THAT INSERTS LoanCalculatorResultModel INTO DATABASE
  Future<bool> insertPaymentCalculatorResult(LoanCalculatorResultModel paymentCalculatorResult) async {
    var db = await dbHelper.database;
    return await db.insert(
              'userLoanRecords',
              paymentCalculatorResult.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            ) ==
            0
        ? false
        : true;
  }
}
