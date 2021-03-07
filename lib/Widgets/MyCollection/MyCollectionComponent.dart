import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/DatabaseHelper.dart';
import 'package:my_home_loan/Models/payment-calculator-result.dart';
import 'package:sqflite/sqflite.dart';

class MyCollectionComponent extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;
  Future<List<_DataSource>> _func;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PaymentCalculatorResult>>(
        future: paymentCalculatorResults(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PaymentCalculatorResult>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else if (snapshot.data.length == 0)
              return Center(child: Text('Collection is empty'));
            else
              return ListView(
                children: [
                  PaginatedDataTable(
                    rowsPerPage: snapshot.data.length,
                    columns: [
                      DataColumn(label: Text('id')),
                      DataColumn(label: Text('title')),
                      DataColumn(label: Text('value01')),
                      DataColumn(label: Text('value02')),
                      DataColumn(label: Text('result')),
                    ],
                    source: _DataSource(context, snapshot.data),
                  ),
                ],

                //     List.generate(snapshot.data.length, (index) {
                //   return Text('${snapshot.data[index].title}');
                // }
                // )
              );
          }
        });
  }

  Future<List<PaymentCalculatorResult>> paymentCalculatorResults() async {
    final Database db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query('userLoanRecords');

    var paymentCalculatorResultsList = List.generate(maps.length, (i) {
      return PaymentCalculatorResult(maps[i]['id'], maps[i]['title'],
          maps[i]['value01'].toDouble(), maps[i]['value02'].toDouble());
    });

    return paymentCalculatorResultsList;
  }
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final List<PaymentCalculatorResult> listResult;
  List<PaymentCalculatorResult> _rows;

  _DataSource(this.context, this.listResult) {
    _rows = listResult;
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.id.toString())),
        DataCell(Text(row.title.toString())),
        DataCell(Text(row.value01.toString())),
        DataCell(Text(row.value02.toString())),
        DataCell(Text(row.result.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
