import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';
import 'package:sqflite/sqflite.dart';

import 'database-helper.dart';

// https://medium.com/@bruno.santos_/why-to-use-repository-pattern-in-your-application-flutter-549c0739a892
abstract class ILoanCalculatorRepository {
  Future<List<LoanCalculatorResultModel>> getAllLoanCalculatorResults();
  Future<void> deleteLoanCalculatorResult(int rowId);
  Future<void> putLoanCalculatorResult(LoanCalculatorResultModel paymentCalculatorResult);
  Future<bool> postLoanCalculatorResult(LoanCalculatorResultModel paymentCalculatorResult);
}

class LoanCalculatorRepository implements ILoanCalculatorRepository {
  final dbHelper = DatabaseHelper.instance;

  // GET
  @override
  Future<List<LoanCalculatorResultModel>> getAllLoanCalculatorResults() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('userLoanRecords', orderBy: "isFavourite DESC");
    // await Future.delayed(Duration(seconds: 3));
    var paymentCalculatorResultsList = List.generate(maps.length, (i) {
      return LoanCalculatorResultModel(maps[i]['id'], maps[i]['title'], maps[i]['value01'].toDouble(), maps[i]['value02'].toDouble(),
          maps[i]['isFavourite'], maps[i]['creationDate'], maps[i]['modificationDate']);
    });

    return paymentCalculatorResultsList;
  }

  // DELETE
  @override
  Future<void> deleteLoanCalculatorResult(int rowId) async {
    final db = await dbHelper.database;
    await db.delete('userLoanRecords', where: 'id = ?', whereArgs: [rowId]);
  }

  // PUT
  @override
  Future<bool> putLoanCalculatorResult(LoanCalculatorResultModel paymentCalculatorResult) async {
    final db = await dbHelper.database;
    return await db.update(
              'userLoanRecords',
              paymentCalculatorResult.toMap(),
              where: "id = ?",
              whereArgs: [paymentCalculatorResult.id],
            ) ==
            0
        ? false
        : true;
  }

  // POST
  @override
  Future<bool> postLoanCalculatorResult(LoanCalculatorResultModel paymentCalculatorResult) async {
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
