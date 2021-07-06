import 'package:flutter/cupertino.dart';

class LoanCalculatorResultModel extends ChangeNotifier {
  int id;
  String title = '';
  double value01 = 0.0;
  double value02 = 0.0;
  double propertyValue = 0.0;
  double userDeposit = 0.0;
  double loanDuration = 0.0;
  double bankInterestRate = 0.0;
  double solicitorFee = 0.0;
  double pestAndBuildingFee = 0.0;
  String state = '';
  int propertyType;
  int buildingType;
  int isFirstTimeBuyer;
  double get result => value01 + value02;
  int isFavourite = 0;
  String creationDate = '';
  String modificationDate = '';

  LoanCalculatorResultModel(
      this.id,
      this.title,
      this.value01,
      this.value02,
      this.propertyValue,
      this.userDeposit,
      this.loanDuration,
      this.bankInterestRate,
      this.solicitorFee,
      this.pestAndBuildingFee,
      this.state,
      this.propertyType,
      this.buildingType,
      this.isFirstTimeBuyer,
      this.isFavourite,
      this.creationDate,
      this.modificationDate);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value01': value01,
      'value02': value02,
      'propertyValue': propertyValue,
      'userDeposit': userDeposit,
      'loanDuration': loanDuration,
      'bankInterestRate': bankInterestRate,
      'solicitorFee': solicitorFee,
      'pestAndBuildingFee': pestAndBuildingFee,
      'state': state,
      'propertyType': propertyType,
      'buildingType': buildingType,
      'isFirstTimeBuyer': isFirstTimeBuyer,
      'result': result,
      'isFavourite': isFavourite,
      'creationDate': creationDate,
      'modificationDate': modificationDate
    };
  }
}
