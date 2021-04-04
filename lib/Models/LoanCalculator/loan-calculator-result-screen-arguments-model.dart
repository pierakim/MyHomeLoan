import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';

class LoanCalculatorResultScreenArgumentsModel {
  final bool isBeingCreated;
  final bool isBeingEdited;
  final LoanCalculatorResultModel loanCalculatorResultModel;

  LoanCalculatorResultScreenArgumentsModel(this.isBeingCreated, this.isBeingEdited, this.loanCalculatorResultModel);
}
