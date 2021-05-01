import 'package:flutter/cupertino.dart';

class LoanCalculatorResultModel extends ChangeNotifier {
  int id;
  String title = '';
  double value01 = 0.0;
  double value02 = 0.0;
  double propertyValue = 0.0;
  double userDeposit = 0.0;
  double get result => value01 + value02;
  int isFavourite = 0;
  String creationDate = '';
  String modificationDate = '';

  LoanCalculatorResultModel(this.id, this.title, this.value01, this.value02, this.propertyValue, this.userDeposit, this.isFavourite,
      this.creationDate, this.modificationDate);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value01': value01,
      'value02': value02,
      'propertyValue': propertyValue,
      'userDeposit': userDeposit,
      'result': result,
      'isFavourite': isFavourite,
      'creationDate': creationDate,
      'modificationDate': modificationDate
    };
  }
}
