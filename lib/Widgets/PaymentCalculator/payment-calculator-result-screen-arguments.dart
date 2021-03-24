import 'package:my_home_loan/Models/payment-calculator-result.dart';

class PaymentCalculatorResultScreenArguments {
  final bool isBeingCreated;
  final bool isBeingEdited;
  final PaymentCalculatorResult paymentCalculatorResult;

  PaymentCalculatorResultScreenArguments(
      this.isBeingCreated, this.isBeingEdited, this.paymentCalculatorResult);
}
