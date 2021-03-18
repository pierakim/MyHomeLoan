import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/DatabaseHelper.dart';
import 'package:my_home_loan/Models/payment-calculator-result.dart';
import 'package:my_home_loan/Widgets/Common/card-information.component.dart';
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
    return mainScreen(context);
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

  SingleChildScrollView mainScreen(BuildContext ctx) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardInformationComponent(
              icon: Icon(Icons.home, color: Theme.of(context).accentColor),
              title: "Your saved collection",
              description: "Your collection",
            ),
            FutureBuilder<List<PaymentCalculatorResult>>(
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
                      return Card(child: tableBody(context, snapshot.data));
                  }
                })
          ],
        ),
      ),
    );
  }

  SingleChildScrollView tableBody(BuildContext ctx,
      List<PaymentCalculatorResult> paymentCalculatorResults) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FittedBox(
        child: DataTable(
          // columnSpacing: 20,
          dataRowHeight: 75,
          dividerThickness: 1,
          headingRowHeight: 0,
          columns: [
            DataColumn(
              label: Text(""),
            ),
            DataColumn(
              label: Text(""),
            ),
            DataColumn(
              label: Text(""),
            ),
            DataColumn(
              label: Text(""),
            ),
          ],
          rows: paymentCalculatorResults
              .map(
                (paymentCalculatorResult) => DataRow(cells: [
                  // FAVOURITE
                  DataCell(GestureDetector(
                      onTap: () {
                        favouriteSelected(paymentCalculatorResult);
                      },
                      child: paymentCalculatorResult.isFavourite == 0
                          ? Icon(Icons.favorite_border_outlined, size: 30)
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ))),
                  // EDIT
                  DataCell(GestureDetector(
                      onTap: () {
                        //editSelected(paymentCalculatorResult.id);
                      },
                      child: Icon(Icons.edit_outlined, size: 30))),
                  // DESCRIPTION/TITLE
                  DataCell(
                    Container(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              // width: 150,
                              child: Text(paymentCalculatorResult.title,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              // width: 150,
                              child: Text(
                                  "Value 01: " +
                                      paymentCalculatorResult.value01
                                          .toString() +
                                      "  " +
                                      "Value 02: " +
                                      paymentCalculatorResult.value02
                                          .toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // DELETE
                  DataCell(GestureDetector(
                      onTap: () {
                        deleteSelected(paymentCalculatorResult.id);
                      },
                      child: Icon(
                        Icons.delete_outlined,
                        size: 30,
                      ))),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
