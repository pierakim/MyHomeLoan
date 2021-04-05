import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';

class LoanCalculatorResultScreenArgumentsModel {
  final LoanCalculatorResultModel loanCalculatorResultModel;
  final bool isInEditMode;

  LoanCalculatorResultScreenArgumentsModel(this.loanCalculatorResultModel, [this.isInEditMode = false]);
}
