import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/DatabaseHelper.dart';
import 'package:my_home_loan/Models/payment-calculator-result.dart';
import 'package:sqflite/sqflite.dart';

class MyCollectionComponent extends StatefulWidget {
  @override
  _MyCollectionComponentState createState() => _MyCollectionComponentState();
}

class _MyCollectionComponentState extends State<MyCollectionComponent> {
  Future<List<PaymentCalculatorResult>> _paymentCalculatorResults;
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _paymentCalculatorResults = getPaymentCalculatorResults();
  }

  void refreshList() {
    setState(() {
      _paymentCalculatorResults = getPaymentCalculatorResults();
    });
  }

  Future<List<PaymentCalculatorResult>> getPaymentCalculatorResults() async {
    print("getPaymentCalculatorResults");
    final Database db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query('userLoanRecords');

    // emulate time
    // await Future.delayed(Duration(seconds: 1));

    var paymentCalculatorResultsList = List.generate(maps.length, (i) {
      return PaymentCalculatorResult(maps[i]['id'], maps[i]['title'],
          maps[i]['value01'].toDouble(), maps[i]['value02'].toDouble());
    });

    return paymentCalculatorResultsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PaymentCalculatorResult>>(
        future: _paymentCalculatorResults,
        builder: (BuildContext context,
            AsyncSnapshot<List<PaymentCalculatorResult>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else if (snapshot.data.length == 0)
              return Center(child: Text('Collection is empty'));
            else
              return tableBody(context, snapshot.data);
          }
        });
  }

  deleteSelected(int rowId) async {
    await deletePaymentCalculatorResult(rowId);
    refreshList();
  }

  Future<void> deletePaymentCalculatorResult(int rowId) async {
    final db = await dbHelper.database;
    await db.delete('userLoanRecords', where: 'id = ?', whereArgs: [rowId]);
  }

  SingleChildScrollView tableBody(BuildContext ctx,
      List<PaymentCalculatorResult> paymentCalculatorResults) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 50,
          dividerThickness: 5,
          columns: [
            DataColumn(
              label: Text(""),
              numeric: true,
            ),
            DataColumn(
              label: Text(""),
              numeric: true,
            ),
            DataColumn(
              label: Text("Description"),
              numeric: false,
              tooltip: "The description",
            ),
            DataColumn(
              label: Text("Value 01"),
              numeric: true,
            ),
            DataColumn(
              label: Text("Value 02"),
              numeric: true,
            ),
            DataColumn(
              label: Text("Result"),
              numeric: true,
            ),
          ],
          rows: paymentCalculatorResults
              .map(
                (paymentCalculatorResults) => DataRow(cells: [
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.favorite_border_outlined),
                      tooltip: 'Favorite',
                      onPressed: () {
                        deleteSelected(paymentCalculatorResults.id);
                      },
                    ),
                  ),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.delete_outlined),
                      tooltip: 'Delete',
                      onPressed: () {
                        deleteSelected(paymentCalculatorResults.id);
                      },
                    ),
                  ),
                  DataCell(
                    Text(paymentCalculatorResults.title),
                  ),
                  DataCell(
                    Text(paymentCalculatorResults.value01.toString()),
                  ),
                  DataCell(
                    Text(paymentCalculatorResults.value02.toString()),
                  ),
                  DataCell(
                    Text(paymentCalculatorResults.result.toString()),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
