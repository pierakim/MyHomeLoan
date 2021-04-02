import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';

class LoanCalculatorResultScreenArgumentsModel {
  final bool isBeingCreated;
  final bool isBeingEdited;
  final LoanCalculatorResultModel paymentCalculatorResult;

  LoanCalculatorResultScreenArgumentsModel(
      this.isBeingCreated, this.isBeingEdited, this.paymentCalculatorResult);
}
