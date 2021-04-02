import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Widgets/Common/card-information.widget.dart';
import 'package:my_home_loan/Widgets/Common/text-input.widget.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';

import '../Common/number-input.widget.dart';
import '../app-drawer.widget.dart';

/// This is the stateful widget that the main application instantiates.
class LoanCalculatorWidget extends StatefulWidget {
  static const String routeName = '/loanCalculator';

  LoanCalculatorWidget({Key key}) : super(key: key);

  @override
  _LoanCalculatorWidgetState createState() => _LoanCalculatorWidgetState();
}

/// This is the private State class that goes with PaymentCalculatorComponent.
class _LoanCalculatorWidgetState extends State<LoanCalculatorWidget> {
  // FORM KEY
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<NumberInputWidgetState> _value01StateKey = GlobalKey();
  final GlobalKey<NumberInputWidgetState> _value02StateKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Color _textColor;
  bool isTile01Valid = false;
  bool isTile01FieldsTouched = false;

  @override
  Widget build(BuildContext context) {
    // ROUTE ARGUMENT
    final LoanCalculatorResultScreenArgumentsModel paymentCalculatorResultScreenArguments =
        ModalRoute.of(context).settings.arguments;

    // ROUTE PARAMETERS EXTRACTION
    final LoanCalculatorResultModel paymentCalculatorResult =
        paymentCalculatorResultScreenArguments.paymentCalculatorResult;

    // PARAMETERS TO CONTROLLER
    final _paymentCalculatorResultId = TextEditingController(
        text: paymentCalculatorResult.id != null ? paymentCalculatorResult.id.toString() : null);
    final _titleController = TextEditingController(
        text: paymentCalculatorResult.title != null
            ? paymentCalculatorResult.title.toString()
            : null);
    final _value01Controller = TextEditingController(
        text: paymentCalculatorResult.value01 != null
            ? paymentCalculatorResult.value01.toString()
            : null);
    final _value02Controller = TextEditingController(
        text: paymentCalculatorResult.value02 != null
            ? paymentCalculatorResult.value02.toString()
            : null);

    return Scaffold(
        appBar: AppBar(
          title: Text("New loan calculator"),
        ),
        drawer: AppDrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // LOAN INFORMATION CARD
                CardInformationWidget(
                  icon: Icon(Icons.home, color: Theme.of(context).accentColor),
                  title: "Loan repayment calculator",
                  description: "Estimate your loan repayment including different fees and rates.",
                ),
                // CARD
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.arrow_drop_down_circle),
                          title: const Text('Home Information'),
                          subtitle: Text(
                            'The home infomormation details',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        // if (_titleController.value.text.isNotEmpty)
                        TextInputWidget(
                            //key: _value02StateKey,
                            controller: _titleController,
                            icon: Icon(Icons.description_outlined,
                                color: Theme.of(context).accentColor),
                            inputLabelText: 'Title / description',
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis."),
                        NumberInputWidget(
                          //key: _value01StateKey,
                          controller: _value01Controller,
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
                        NumberInputWidget(
                            //key: _value02StateKey,
                            controller: _value02Controller,
                            icon: Icon(Icons.attach_money, color: Theme.of(context).accentColor),
                            inputLabelText: 'Value 02 (not mandatory)',
                            inputPrefixText: '\$ ',
                            inputSufixText: 'AUD'),
                      ],
                    ),
                  ),
                ),
                // SAVE BUTTON
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
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(
                            context,
                            Routes.readOnlyLoan,
                            arguments: new LoanCalculatorResultScreenArgumentsModel(
                                true,
                                false,
                                new LoanCalculatorResultModel(
                                    _paymentCalculatorResultId.value.text == null
                                        ? int.parse(_paymentCalculatorResultId.value.text)
                                        : null,
                                    _titleController.value.text.isNotEmpty
                                        ? _titleController.value.text
                                        : '',
                                    double.parse(_value01Controller.value.text) ?? 0.0,
                                    double.parse(_value02Controller.value.text) ?? 0.0,
                                    0,
                                    DateTime.now().toUtc().toString(),
                                    DateTime.now().toUtc().toString())),
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
        ));
  }
}
