import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/payment-calculator-result.dart';
import 'package:my_home_loan/Widgets/Common/card-information.component.dart';

import '../Common/number-input.component.dart';

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

  final GlobalKey<NumberInputComponentState> _mortgageValueStateKey =
      GlobalKey();

  final GlobalKey<NumberInputComponentState> _transferFeeValueStateKey =
      GlobalKey();

  TextEditingController _mortgageValueController;
  TextEditingController _transferFeetValueController;
  TextEditingController _value01Controller;
  TextEditingController _value02Controller;

  @override
  void initState() {
    super.initState();
    _mortgageValueController = TextEditingController();
    _transferFeetValueController = TextEditingController();
    _value01Controller = TextEditingController();
    _value02Controller = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _mortgageValueController.dispose();
    _transferFeetValueController.dispose();
    _value01Controller.dispose();
    _value02Controller.dispose();
    super.dispose();
  }

  Color _textColor = Colors.green;

  bool isTile01Valid = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardInformationComponent(
              icon: Icon(Icons.home, color: Colors.cyan[600]),
              title: "Loan repayment calculator",
              description:
                  "Estimate your loan repayment including different fees and rates.",
            ),
            Card(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // ********
                      // TILES 01
                      // ********
                      ExpansionTile(
                        onExpansionChanged: (value) {
                          if (!value) {
                            // only on closing
                            isTile01Valid = _mortgageValueStateKey
                                        .currentState.inputValue !=
                                    null &&
                                _transferFeetValueController
                                    .value.text.isNotEmpty;

                            setState(() {
                              if (!isTile01Valid) {
                                _textColor = Theme.of(context).accentColor;
                                print(_textColor);
                              }
                              // _textColor =
                              //     isTile01Valid ? Colors.amber : Colors.red;
                            });
                          }
                        },
                        maintainState: true,
                        title: Text("Bank & Finance",
                            style: TextStyle(color: _textColor)),
                        subtitle: Text("Your bank and finance information",
                            style: TextStyle(color: _textColor)),
                        children: <Widget>[
                          // **************
                          // MORTGAGE VALUE
                          // **************
                          NumberInputComponent(
                            key: _mortgageValueStateKey,
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.cyan[600],
                            ),
                            inputLabelText: 'Mortgage value',
                            inputPrefixText: '\$ ',
                            inputSufixText: 'AUD',
                            validationText: 'Please enter a value',
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis.",
                          ),
                          // *********
                          // FEE VALUE
                          // *********
                          NumberInputComponent(
                              key: _transferFeeValueStateKey,
                              icon: Icon(Icons.attach_money,
                                  color: Colors.cyan[600]),
                              inputLabelText: 'Transfer fee value',
                              inputPrefixText: '\$ ',
                              inputSufixText: 'AUD',
                              validationText: 'Please enter a value'),
                        ],
                      ),
                      // ********
                      // TILES 02
                      // ********
                      ExpansionTile(
                        maintainState: true,
                        title: Text("Another tile"),
                        subtitle: Text("This is another tile you know."),
                        children: <Widget>[
                          // **************
                          // MORTGAGE VALUE
                          // **************
                          NumberInputComponent(
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.cyan[600],
                            ),
                            inputLabelText: 'Value 01',
                            inputPrefixText: '\$ ',
                            inputSufixText: 'AUD',
                            validationText: 'Please enter a value',
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis.",
                          ),
                          // *********
                          // FEE VALUE
                          // *********
                          NumberInputComponent(
                            icon: Icon(Icons.attach_money,
                                color: Colors.cyan[600]),
                            inputLabelText: 'Value 02',
                            inputPrefixText: '\$ ',
                            inputSufixText: 'AUD',
                            validationText: 'Please enter a value',
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
                                  arguments: new PaymentCalculatorResult(
                                      _mortgageValueStateKey
                                          .currentState.inputValue,
                                      _transferFeeValueStateKey
                                          .currentState.inputValue),
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 64.0, right: 64.0),
                              child: Text('Tell me!'),
                            ),
                          ),
                        ),
                      ),
                    ],
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
