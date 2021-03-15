import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

    final List<Map<String, dynamic>> maps =
        await db.query('userLoanRecords', orderBy: "isFavourite DESC");

    // emulate time
    // await Future.delayed(Duration(seconds: 3));

    var paymentCalculatorResultsList = List.generate(maps.length, (i) {
      return PaymentCalculatorResult(
          maps[i]['id'],
          maps[i]['title'],
          maps[i]['value01'].toDouble(),
          maps[i]['value02'].toDouble(),
          maps[i]['isFavourite'],
          maps[i]['creationDate'],
          maps[i]['modificationDate']);
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

  // DELETE
  deleteSelected(int rowId) async {
    await deletePaymentCalculatorResult(rowId);
    refreshList();
  }

  Future<void> deletePaymentCalculatorResult(int rowId) async {
    final db = await dbHelper.database;
    await db.delete('userLoanRecords', where: 'id = ?', whereArgs: [rowId]);
  }

  // FAVOURITE
  favouriteSelected(PaymentCalculatorResult paymentCalculatorResult) async {
    await updatePaymentCalculatorResult(paymentCalculatorResult);
    refreshList();
  }

  Future<void> updatePaymentCalculatorResult(
      PaymentCalculatorResult paymentCalculatorResult) async {
    final db = await dbHelper.database;

    paymentCalculatorResult.isFavourite =
        paymentCalculatorResult.isFavourite == 0 ? 1 : 0;

    await db.update(
      'userLoanRecords',
      paymentCalculatorResult.toMap(),
      where: "id = ?",
      whereArgs: [paymentCalculatorResult.id],
    );
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
            DataColumn(
              label: Text("Created date"),
              numeric: true,
            ),
          ],
          rows: paymentCalculatorResults
              .map(
                (paymentCalculatorResult) => DataRow(cells: [
                  DataCell(
                    IconButton(
                      icon: paymentCalculatorResult.isFavourite == 0
                          ? Icon(Icons.favorite_border_outlined)
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                      tooltip: 'Favorite',
                      onPressed: () {
                        favouriteSelected(paymentCalculatorResult);
                      },
                    ),
                  ),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete_outlined),
                      tooltip: 'Delete',
                      onPressed: () {
                        deleteSelected(paymentCalculatorResult.id);
                      },
                    ),
                  ),
                  DataCell(
                    Text(paymentCalculatorResult.title),
                  ),
                  DataCell(
                    Text(paymentCalculatorResult.value01.toString()),
                  ),
                  DataCell(
                    Text(paymentCalculatorResult.value02.toString()),
                  ),
                  DataCell(
                    Text(paymentCalculatorResult.result.toString()),
                  ),
                  DataCell(
                    //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
                    Text(DateFormat('dd/MM/yyyy').format(
                        DateTime.parse(paymentCalculatorResult.creationDate))),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
