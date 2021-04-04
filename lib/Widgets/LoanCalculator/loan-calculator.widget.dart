import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Widgets/Common/card-information.widget.dart';
import 'package:my_home_loan/Widgets/Common/text-input.widget.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';

import '../Common/number-input.widget.dart';
import '../app-drawer.widget.dart';

class LoanCalculatorWidget extends StatefulWidget {
  // ROUTE NAME
  static const String routeName = '/loanCalculator';

  LoanCalculatorWidget({Key key}) : super(key: key);

  @override
  _LoanCalculatorWidgetState createState() => _LoanCalculatorWidgetState();
}

class _LoanCalculatorWidgetState extends State<LoanCalculatorWidget> {
  //MAIN STATE: LoanCalculatorResultScreenArgumentsModel
  LoanCalculatorResultScreenArgumentsModel loanCalculatorResultScreenArgumentsModel;

  // FORM KEY
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loanCalculatorResultScreenArgumentsModel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ROUTE ARGUMENT
    final LoanCalculatorResultScreenArgumentsModel paymentCalculatorResultScreenArguments = ModalRoute.of(context).settings.arguments;

    // EDIT LOAN
    if (paymentCalculatorResultScreenArguments.loanCalculatorResultModel != null) {
      setState(() {
        this.loanCalculatorResultScreenArgumentsModel = paymentCalculatorResultScreenArguments;
      });
    }
    // NEW LOAN
    else if (this.loanCalculatorResultScreenArgumentsModel == null) {
      setState(() {
        this.loanCalculatorResultScreenArgumentsModel = new LoanCalculatorResultScreenArgumentsModel(true, false,
            new LoanCalculatorResultModel(null, '', null, null, 0, DateTime.now().toUtc().toString(), DateTime.now().toUtc().toString()));
      });
    }

    // PARAMETERS TO CONTROLLER
    final _modelIdController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id.toString()
            : null);
    final _modelTitleController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title.toString()
            : null);
    final _modelValue01Controller = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01 != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01.toString()
            : null);
    final _modelValue02Controller = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02 != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02.toString()
            : null);

    // HANDLE LOAN CALCULATOR SUBMIT - TELL ME
    void _handleSubmitted() {
      // Validate will return true if the form is valid, or false if
      // the form is invalid.
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();
        FocusScope.of(context).unfocus();

        setState(() {
          this.loanCalculatorResultScreenArgumentsModel = new LoanCalculatorResultScreenArgumentsModel(
              true,
              false,
              new LoanCalculatorResultModel(
                  _modelIdController.value.text == null ? int.parse(_modelIdController.value.text) : null,
                  _modelTitleController.value.text.isNotEmpty ? _modelTitleController.value.text : '',
                  double.parse(_modelValue01Controller.value.text) ?? 0.0,
                  double.parse(_modelValue02Controller.value.text) ?? 0.0,
                  0,
                  DateTime.now().toUtc().toString(),
                  DateTime.now().toUtc().toString()));
        });

        Navigator.pushNamed(
          context,
          Routes.loanCalculatorResultWidget,
          arguments: new LoanCalculatorResultScreenArgumentsModel(
              true,
              false,
              new LoanCalculatorResultModel(
                  _modelIdController.value.text == null ? int.parse(_modelIdController.value.text) : null,
                  _modelTitleController.value.text.isNotEmpty ? _modelTitleController.value.text : '',
                  double.parse(_modelValue01Controller.value.text) ?? 0.0,
                  double.parse(_modelValue02Controller.value.text) ?? 0.0,
                  0,
                  DateTime.now().toUtc().toString(),
                  DateTime.now().toUtc().toString())),
        );
      }
    }

    // WIDGET
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
                        TextInputWidget(
                            controller: _modelTitleController,
                            icon: Icon(Icons.description_outlined, color: Theme.of(context).accentColor),
                            inputLabelText: 'Title / description',
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis."),
                        NumberInputWidget(
                          controller: _modelValue01Controller,
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
                            controller: _modelValue02Controller,
                            icon: Icon(Icons.attach_money, color: Theme.of(context).accentColor),
                            inputLabelText: 'Value 02 (not mandatory)',
                            inputPrefixText: '\$ ',
                            inputSufixText: 'AUD'),
                      ],
                    ),
                  ),
                ),
                // TELL ME BUTTON
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: _handleSubmitted,
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
