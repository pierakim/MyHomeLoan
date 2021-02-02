import 'package:flutter/material.dart';
import 'package:your_home_loan/Models/HomeLoanDatarResult.dart';

import '../number-input-widget.dart';

/// This is the stateful widget that the main application instantiates.
class PaymentCalculatorComponent extends StatefulWidget {
  PaymentCalculatorComponent({Key key}) : super(key: key);

  @override
  _PaymentCalculatorComponentState createState() =>
      _PaymentCalculatorComponentState();
}

/// This is the private State class that goes with PaymentCalculatorComponent.
class _PaymentCalculatorComponentState
    extends State<PaymentCalculatorComponent> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _mortgageValueController;
  TextEditingController _transferFeetValueController;

  @override
  void initState() {
    super.initState();
    _mortgageValueController = TextEditingController();
    _transferFeetValueController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _mortgageValueController.dispose();
    _transferFeetValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExpansionTile(
              title: Text("Bank & Finance"),
              subtitle: Text("Your bank and finance information"),
              children: <Widget>[
                NumberInputComponent(
                  icon: const Icon(Icons.attach_money),
                  inputLabelText: 'Mortgage value',
                  inputPrefixText: '\$ ',
                  inputSufixText: 'AUD',
                  validationText: 'Please enter a value',
                  controller: _mortgageValueController,
                ),
                NumberInputComponent(
                  icon: const Icon(Icons.attach_money),
                  inputLabelText: 'Transfer fee value',
                  inputPrefixText: '\$ ',
                  inputSufixText: 'AUD',
                  validationText: 'Please enter a value',
                  controller: _transferFeetValueController,
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      Navigator.pushNamed(
                        context,
                        '/extractArguments',
                        arguments: new PaymentResult(
                            double.parse(_mortgageValueController.text),
                            double.parse(_transferFeetValueController.text)),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 64.0, right: 64.0),
                    child: Text('Tell me!'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
