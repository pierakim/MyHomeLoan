import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/payment-calculator-result.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Widgets/Common/card-information.component.dart';

import '../Common/number-input.component.dart';
import '../app-drawer.component.dart';

/// This is the stateful widget that the main application instantiates.
class PaymentCalculatorComponent extends StatefulWidget {
  static const String routeName = '/loanCalculator';

  PaymentCalculatorComponent({Key key}) : super(key: key);

  @override
  _PaymentCalculatorComponentState createState() =>
      _PaymentCalculatorComponentState();
}

/// This is the private State class that goes with PaymentCalculatorComponent.
class _PaymentCalculatorComponentState
    extends State<PaymentCalculatorComponent> {
  // Form key
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<NumberInputComponentState> _value01StateKey = GlobalKey();
  final GlobalKey<NumberInputComponentState> _value02StateKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_value01StateKey.currentState != null)
      _value01StateKey.currentState.dispose();

    if (_value02StateKey.currentState != null)
      _value02StateKey.currentState.dispose();
    super.dispose();
  }

  Color _textColor;
  bool isTile01Valid = false;
  bool isTile01FieldsTouched = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return new Scaffold(
        appBar: AppBar(
          title: Text("New loan calculator"),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CardInformationComponent(
                  icon: Icon(Icons.home, color: Theme.of(context).accentColor),
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
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Theme(
                              //new
                              data: theme, //new
                              child: ExpansionTile(
                                onExpansionChanged: (value) {
                                  if (!value) {
                                    // only on closing
                                    isTile01Valid = _value01StateKey
                                            .currentState.inputValue !=
                                        null;

                                    // are fields touched
                                    isTile01FieldsTouched = _value01StateKey
                                            .currentState.hasBeenTouched ||
                                        _value02StateKey
                                            .currentState.hasBeenTouched;

                                    setState(() {
                                      if (isTile01FieldsTouched) {
                                        if (!isTile01Valid) {
                                          _textColor = Colors.red;
                                        } else {
                                          _textColor =
                                              Theme.of(context).accentColor;
                                        }
                                      }
                                    });
                                  }
                                },
                                maintainState: true,
                                title: Text("Your bank and finance information",
                                    style: TextStyle(color: _textColor)),
                                subtitle: Text(
                                    "Your bank and finance information",
                                    style: TextStyle(color: _textColor)),
                                children: <Widget>[
                                  // **************
                                  // MORTGAGE VALUE
                                  // **************
                                  NumberInputComponent(
                                    key: _value01StateKey,
                                    icon: Icon(
                                      Icons.attach_money,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    inputLabelText: 'Value 01 (mandatory)',
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
                                      key: _value02StateKey,
                                      icon: Icon(Icons.attach_money,
                                          color: Theme.of(context).accentColor),
                                      inputLabelText:
                                          'Value 02 (not mandatory)',
                                      inputPrefixText: '\$ ',
                                      inputSufixText: 'AUD'),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  final form = _formKey.currentState;
                                  if (form.validate()) {
                                    form.save();
                                    FocusScope.of(context).unfocus();
                                    Navigator.pushNamed(
                                      context,
                                      Routes.readOrEditLoan,
                                      arguments: new PaymentCalculatorResult(
                                          null,
                                          '',
                                          _value01StateKey
                                              .currentState.inputValue,
                                          _value02StateKey
                                                  .currentState.inputValue ??
                                              0.0,
                                          0,
                                          DateTime.now().toUtc().toString(),
                                          DateTime.now().toUtc().toString()),
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
        ));
  }
}
