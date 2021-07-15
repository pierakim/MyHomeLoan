import 'package:flutter/cupertino.dart';
import 'package:my_home_loan/Models/StampDuty/stamp-duty-calculator-result.model.dart';

class LoanCalculatorResultModel extends ChangeNotifier {
  int id;
  String title = '';
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
  int isFavourite = 0;
  String creationDate = '';
  String modificationDate = '';

  // Results attached to models
  double get stampDutyResult => getStampDutyResult(propertyValue, state, propertyType, buildingType, isFirstTimeBuyer);
  double get result => propertyValue + userDeposit;

  LoanCalculatorResultModel(
      this.id,
      this.title,
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

  double getStampDutyResult(double propertyValue, String state, int propertyType, int buildingType, int isFirstTimeBuyer) {
    var stampDutyCalculatorResultModel = new StampDutyCalculatorResultModel(propertyValue, state, propertyType, buildingType, isFirstTimeBuyer);
    return stampDutyCalculatorResultModel.result;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
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
