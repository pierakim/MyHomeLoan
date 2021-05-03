import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Widgets/Common/card-information.widget.dart';
import 'package:my_home_loan/Widgets/Common/text-input.widget.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';
import 'package:my_home_loan/Widgets/StampDutyCalculator/stamp-duty-calculator.widget.dart';

import '../Common/number-input.widget.dart';

class LoanCalculatorCardWidget extends StatefulWidget {
  // ROUTE NAME
  static const String routeName = '/loanCalculator';

  LoanCalculatorCardWidget({Key key}) : super(key: key);

  @override
  _LoanCalculatorCardWidgetState createState() => _LoanCalculatorCardWidgetState();
}

class _LoanCalculatorCardWidgetState extends State<LoanCalculatorCardWidget> {
  //MAIN STATE: LoanCalculatorResultScreenArgumentsModel
  LoanCalculatorResultScreenArgumentsModel loanCalculatorResultScreenArgumentsModel;
  TextEditingController _modelIdController;
  TextEditingController _modelTitleController;
  TextEditingController _modelValue01Controller;
  TextEditingController _modelValue02Controller;
  TextEditingController _propertyValueController;
  TextEditingController _userDepositController;
  TextEditingController _loanDurationController;
  TextEditingController _bankInterestRateController;
  TextEditingController _solicitorFeeController;
  TextEditingController _pestAndBuildingFeeController;
  bool _inEditMode = false;

  // FORM KEY
  final _formKey = GlobalKey<FormState>();
  final _stampDutyKey = GlobalKey<FormState>();

  @override
  void initState() {
    // https://stackoverflow.com/a/59881577
    // Accesssing the context to get the arguments (if needed) from the route here.
    super.initState();
    Future.delayed(Duration.zero, () {
      LoanCalculatorResultScreenArgumentsModel screenArguments = ModalRoute.of(context).settings.arguments;
      // EXISTING LOAN
      if (screenArguments.loanCalculatorResultModel != null) {
        print("EXISTING LOAN");
        setState(() {
          this.loanCalculatorResultScreenArgumentsModel = screenArguments;
          this._inEditMode = true;
        });
      }
      // NEW LOAN
      else if (this.loanCalculatorResultScreenArgumentsModel == null) {
        print("NEW LOAN");
        setState(() {
          this.loanCalculatorResultScreenArgumentsModel = new LoanCalculatorResultScreenArgumentsModel(new LoanCalculatorResultModel(
              null, null, null, null, null, null, null, null, null, null, 0, DateTime.now().toUtc().toString(), DateTime.now().toUtc().toString()));
          this._inEditMode = false;
        });
      }
      // PARAMETERS TO CONTROLLER
      this._modelIdController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id.toString()
              : null);
      this._modelTitleController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title.toString()
              : null);
      this._modelValue01Controller = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01 != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01.toString()
              : null);
      this._modelValue02Controller = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02 != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02.toString()
              : null);
      this._propertyValueController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue.toString()
              : null);
      this._userDepositController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.userDeposit != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.userDeposit.toString()
              : null);
      this._loanDurationController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration.toString()
              : null);
      this._solicitorFeeController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.solicitorFee != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.solicitorFee.toString()
              : null);
      this._pestAndBuildingFeeController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.pestAndBuildingFee != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.pestAndBuildingFee.toString()
              : null);
      this._bankInterestRateController = TextEditingController(
          text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration != null
              ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration.toString()
              : null);
    });
  }

  @override
  void dispose() {
    _modelIdController.dispose();
    _modelTitleController.dispose();
    _modelValue01Controller.dispose();
    _modelValue02Controller.dispose();
    _propertyValueController.dispose();
    _userDepositController.dispose();
    _loanDurationController.dispose();
    _bankInterestRateController.dispose();
    loanCalculatorResultScreenArgumentsModel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // HANDLE LOAN CALCULATOR SUBMIT - TELL ME
    void _handleSubmitted() {
      // Validate will return true if the form is valid, or false if
      // the form is invalid.
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();
        FocusScope.of(context).unfocus();

        setState(() {
          this.loanCalculatorResultScreenArgumentsModel = new LoanCalculatorResultScreenArgumentsModel(new LoanCalculatorResultModel(
              // ISSUE here. Dont understand why it's "", it should be null
              _modelIdController.value.text != null ? int.tryParse(_modelIdController.value.text) : null,
              _modelTitleController.value.text.isNotEmpty ? _modelTitleController.value.text : '',
              double.parse(_modelValue01Controller.value.text) ?? 0.0,
              double.parse(_modelValue02Controller.value.text) ?? 0.0,
              double.parse(_propertyValueController.value.text) ?? 0.0,
              double.parse(_userDepositController.value.text) ?? 0.0,
              double.parse(_loanDurationController.value.text) ?? 0.0,
              double.parse(_bankInterestRateController.value.text) ?? 0.0,
              double.parse(_solicitorFeeController.value.text) ?? 0.0,
              double.parse(_pestAndBuildingFeeController.value.text) ?? 0.0,
              0,
              DateTime.now().toUtc().toString(),
              DateTime.now().toUtc().toString()));
        });

        Navigator.pushNamed(
          context,
          Routes.loanCalculatorResultWidget,
          arguments:
              new LoanCalculatorResultScreenArgumentsModel(this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel, this._inEditMode),
        );
      }
    }

    // WIDGET
    return SingleChildScrollView(
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
                    validationText: 'Enter a value',
                    informationMessage:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis.",
                  ),
                  NumberInputWidget(
                      controller: _modelValue02Controller,
                      icon: Icon(Icons.attach_money, color: Theme.of(context).accentColor),
                      inputLabelText: 'Value 02 (not mandatory)',
                      inputPrefixText: '\$ ',
                      inputSufixText: 'AUD'),
                  NumberInputWidget(
                    controller: _propertyValueController,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    inputLabelText: 'Property value',
                    inputPrefixText: '\$ ',
                    inputSufixText: 'AUD',
                    validationText: 'Enter a value',
                    informationMessage: "The value of the property you're interested in.",
                  ),
                  NumberInputWidget(
                    controller: _userDepositController,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    inputLabelText: 'Deposit',
                    inputPrefixText: '\$ ',
                    inputSufixText: 'AUD',
                    validationText: 'Enter a value',
                    informationMessage:
                        "The global deposit you're ready to put for that property. It includes taxes like stamp duty and/or solicitor fee.",
                  ),
                  NumberInputWidget(
                    controller: _loanDurationController,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    inputLabelText: 'Loan duration',
                    inputSufixText: 'year(s)',
                    validationText: 'Enter a value',
                    informationMessage: "The length of your loan.",
                  ),
                  NumberInputWidget(
                    controller: _bankInterestRateController,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    inputLabelText: 'Bank interest rate',
                    inputSufixText: '%',
                    validationText: 'Enter a value',
                    informationMessage: "The interest rate you have for this loan",
                  ),
                  NumberInputWidget(
                    controller: _solicitorFeeController,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    inputLabelText: 'Solicitor fee',
                    inputSufixText: 'AUD',
                    validationText: 'Enter a value',
                    informationMessage: "The solicitor fee.",
                  ),
                  NumberInputWidget(
                    controller: _pestAndBuildingFeeController,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    inputLabelText: 'Pest and building fee',
                    inputSufixText: 'AUD',
                    validationText: 'Enter a value',
                    informationMessage: "The pest and building inspection fee.",
                  ),
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
    ));
  }
}
