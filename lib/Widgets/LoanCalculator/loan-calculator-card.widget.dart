import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';
import 'package:my_home_loan/Models/Types/building-type.model.dart';
import 'package:my_home_loan/Models/Types/first-time-buyer-type.model.dart';
import 'package:my_home_loan/Models/Types/residence-type.model.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Widgets/Common/card-information.widget.dart';
import 'package:my_home_loan/Widgets/Common/dropdown-input.widget.dart';
import 'package:my_home_loan/Widgets/Common/segmented-input-choices.widget.dart';
import 'package:my_home_loan/Widgets/Common/segmented-input.widget.dart';
import 'package:my_home_loan/Widgets/Common/text-input.widget.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';

import '../Common/number-input.widget.dart';

class LoanCalculatorCardWidget extends StatefulWidget {
  // ROUTE NAME
  static const String routeName = '/loanCalculator';

  final LoanCalculatorResultScreenArgumentsModel loanCalculatorResultScreenArgumentsModelParam;

  LoanCalculatorCardWidget({Key key, this.loanCalculatorResultScreenArgumentsModelParam}) : super(key: key);

  @override
  _LoanCalculatorCardWidgetState createState() => _LoanCalculatorCardWidgetState();
}

class _LoanCalculatorCardWidgetState extends State<LoanCalculatorCardWidget> {
  //MAIN STATE: LoanCalculatorResultScreenArgumentsModel
  LoanCalculatorResultScreenArgumentsModel loanCalculatorResultScreenArgumentsModel;
  // Controller
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

  // final _formKey = GlobalKey<FormState>();
  final _homeInformationFormKey = GlobalKey<FormState>();
  final _stampDutyFormKey = GlobalKey<FormState>();

  bool hasFormChanged = false;
  bool isPropertyTypeValid = true;
  bool isBuildingTypeValid = true;
  bool isFirstHomeBuyerValid = true;

  bool isHomeInformationExpansionTileValid = true;
  bool isStampDutyExpansionTileValid = true;

  @override
  void initState() {
    super.initState();

    // SET STATE BASED ON RECEIVED PARAMETER FROM PARENT
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel = widget.loanCalculatorResultScreenArgumentsModelParam;
    });

    this._modelIdController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id.toString()
            : '');
    this._modelTitleController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title.toString()
            : '');
    this._modelValue01Controller = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01 != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01.toString()
            : '');
    this._modelValue02Controller = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02 != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02.toString()
            : '');
    this._propertyValueController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue.toString()
            : '');
    this._userDepositController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.userDeposit != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.userDeposit.toString()
            : '');
    this._loanDurationController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration.toString()
            : '');
    this._bankInterestRateController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.bankInterestRate != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.bankInterestRate.toString()
            : '');
    this._solicitorFeeController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.solicitorFee != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.solicitorFee.toString()
            : '');
    this._pestAndBuildingFeeController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.pestAndBuildingFee != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.pestAndBuildingFee.toString()
            : '');
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
    // HANDLE LOAN CALCULATOR SUBMIT
    void _handleSubmitted() {
      if (this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyType == null) {
        setState(() {
          isPropertyTypeValid = false;
        });
      } else
        setState(() {
          isPropertyTypeValid = true;
        });

      if (this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.buildingType == null) {
        setState(() {
          isBuildingTypeValid = false;
        });
      } else
        setState(() {
          isBuildingTypeValid = true;
        });

      if (this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.isFirstTimeBuyer == null) {
        setState(() {
          isFirstHomeBuyerValid = false;
        });
      } else
        setState(() {
          isFirstHomeBuyerValid = true;
          print('sFirstHomeBuyerValid : false');
        });

      // Validate will return true if the form is valid, or false if
      // the form is invalid.
      final homeInformationFormKey = _homeInformationFormKey.currentState;
      final stampDutyFormKey = _stampDutyFormKey.currentState;

      final isHomeInformationFormValid = homeInformationFormKey.validate();
      final isStampDutyFormValid = stampDutyFormKey.validate();

      setState(() {
        this.isHomeInformationExpansionTileValid = isHomeInformationFormValid;
      });

      setState(() {
        this.isStampDutyExpansionTileValid = isStampDutyFormValid;
      });

      // if (!isHomeInformationFormValid) {
      //   setState(() {
      //     this.isHomeInformationExpansionTileValid = false;
      //   });
      // }

      // if (!isStampDutyFormValid) {
      //   setState(() {
      //     this.isStampDutyExpansionTileValid = false;
      //   });
      // }

      final fullValidation = isHomeInformationFormValid && isStampDutyFormValid;

      if (fullValidation) {
        homeInformationFormKey.save();
        stampDutyFormKey.save();
        FocusScope.of(context).unfocus();

        setState(() {
          this.loanCalculatorResultScreenArgumentsModel = new LoanCalculatorResultScreenArgumentsModel(
              new LoanCalculatorResultModel(
                  _modelIdController.value.text != null ? int.tryParse(_modelIdController.value.text) : null,
                  _modelTitleController.value.text.isNotEmpty ? _modelTitleController.value.text : '',
                  double.parse(_modelValue01Controller.value.text) ?? 0.0,
                  double.parse(_modelValue02Controller.value.text) ?? 0.0,
                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue ?? 0.0,
                  double.parse(_userDepositController.value.text) ?? 0.0,
                  double.parse(_loanDurationController.value.text) ?? 0.0,
                  double.parse(_bankInterestRateController.value.text) ?? 0.0,
                  double.parse(_solicitorFeeController.value.text) ?? 0.0,
                  double.parse(_pestAndBuildingFeeController.value.text) ?? 0.0,
                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.state,
                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyType,
                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.buildingType,
                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.isFirstTimeBuyer,
                  0,
                  DateTime.now().toUtc().toString(),
                  DateTime.now().toUtc().toString()));
        });

        Navigator.pushNamed(
          context,
          Routes.loanCalculatorResultWidget,
          arguments: new LoanCalculatorResultScreenArgumentsModel(
              this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel, this.hasFormChanged),
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
          Card(
            clipBehavior: Clip.antiAlias,
            child: Form(
              key: _homeInformationFormKey,
              child: Column(
                children: [
                  ExpansionTile(
                      //onExpansionChanged: (bool expanding) => validateHomeInformationOnToggle(expanding),
                      onExpansionChanged: (bool expanding) => dismissKeyboard(expanding),
                      maintainState: true,
                      leading: !this.isHomeInformationExpansionTileValid
                          ? Icon(
                              Icons.warning_amber_outlined,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.check_box_outline_blank_outlined,
                              color: Colors.black,
                            ),
                      title: Text(
                        "Home information",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: !this.isHomeInformationExpansionTileValid ? Colors.red : Colors.black),
                      ),
                      subtitle: Text(
                        'The home infomormation details',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      children: <Widget>[
                        TextInputWidget(
                            controller: _modelTitleController,
                            icon: Icon(Icons.description_outlined, color: Theme.of(context).accentColor),
                            inputLabelText: 'Title / description',
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis."),
                        NumberInputWidget(
                          controller: _modelValue01Controller,
                          updateNumberInputValue: updateValue01,
                          //updateTileValidation: validateHomeInformationTile,
                          // updateBlockVality: updateHomeInformationValidity,
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
                            updateNumberInputValue: updateValue02,
                            // updateBlockVality: updateHomeInformationValidity,
                            icon: Icon(Icons.attach_money, color: Theme.of(context).accentColor),
                            inputLabelText: 'Value 02 (not mandatory)',
                            inputPrefixText: '\$ ',
                            inputSufixText: 'AUD'),
                        NumberInputWidget(
                          controller: _propertyValueController,
                          updateNumberInputValue: updatePropertyValue,
                          // updateBlockVality: updateHomeInformationValidity,
                          icon: Icon(
                            Icons.attach_money,
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
                          updateNumberInputValue: updateDepositValue,
                          // updateBlockVality: updateHomeInformationValidity,
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
                          updateNumberInputValue: updateLoanDurationValue,
                          // updateBlockVality: updateHomeInformationValidity,
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
                          updateNumberInputValue: updateBankInterestRateValue,
                          // updateBlockVality: updateHomeInformationValidity,
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
                          updateNumberInputValue: updateSolicitorFee,
                          // updateBlockVality: updateHomeInformationValidity,
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
                          updateNumberInputValue: updatePestAndBuildingFee,
                          // updateBlockVality: updateHomeInformationValidity,
                          icon: Icon(
                            Icons.home_outlined,
                            color: Theme.of(context).accentColor,
                          ),
                          inputLabelText: 'Pest and building fee',
                          inputSufixText: 'AUD',
                          validationText: 'Enter a value',
                          informationMessage: "The pest and building inspection fee.",
                        ),
                      ]),
                ],
              ),
            ),
          ),

          Card(
            clipBehavior: Clip.antiAlias,
            child: Form(
              key: _stampDutyFormKey,
              child: Column(
                children: [
                  ExpansionTile(
                    //onExpansionChanged: (bool expanding) => validateStampDutyOnToggle(expanding),
                    maintainState: true,
                    leading: !this.isStampDutyExpansionTileValid
                        ? Icon(
                            Icons.warning_amber_outlined,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.check_box_outline_blank_outlined,
                            color: Colors.black,
                          ),
                    title: Text(
                      "Stamp duty information",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: !this.isStampDutyExpansionTileValid ? Colors.red : Colors.black),
                    ),
                    subtitle: Text(
                      'Taxes and stamp duty inputs',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    children: <Widget>[
                      DropDownInputWidget(
                        value: this.loanCalculatorResultScreenArgumentsModel != null
                            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.state
                            : null,
                        updateDropDownValue: updateDropDownValue,
                        validationText: 'Select a state',
                        inputLabelText: 'State / Territory of the property',
                        icon: Icon(
                          Icons.not_listed_location_outlined,
                          color: Theme.of(context).accentColor,
                          size: 24.0,
                        ),
                        informationMessage:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in",
                      ),
                      // PROPERTY TYPE
                      SegmentedInputChoicesWidget(
                          icon: Icon(
                            Icons.foundation,
                            color: Theme.of(context).accentColor,
                            size: 24.0,
                          ),
                          informationMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          choices: [
                            SegmentedInputWidget(
                              value:
                                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyType,
                              updateSegmentedInputValue: updatePropertyType,
                              title: 'Property type',
                              mapping: residenceType,
                              isValid: isPropertyTypeValid,
                              isMandatory: true,
                            ),
                          ]),
                      // BUILDING TYPE
                      SegmentedInputChoicesWidget(
                          icon: Icon(
                            Icons.foundation,
                            color: Theme.of(context).accentColor,
                            size: 24.0,
                          ),
                          informationMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          choices: [
                            SegmentedInputWidget(
                              value:
                                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.buildingType,
                              updateSegmentedInputValue: updateBuildingType,
                              title: 'Building type',
                              mapping: buildingType,
                              isValid: isBuildingTypeValid,
                              isMandatory: true,
                            ),
                          ]),
                      // FIRST TIME BUYER
                      SegmentedInputChoicesWidget(
                          icon: Icon(
                            Icons.roofing,
                            color: Theme.of(context).accentColor,
                            size: 24.0,
                          ),
                          informationMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          choices: [
                            SegmentedInputWidget(
                              value: this
                                  .loanCalculatorResultScreenArgumentsModel
                                  .loanCalculatorResultModel
                                  .isFirstTimeBuyer,
                              updateSegmentedInputValue: updateIsFirstTimeBuyer,
                              title: 'Are you first time buyer',
                              mapping: isFirstHomeBuyer,
                              isValid: isFirstHomeBuyerValid,
                              isMandatory: true,
                            ),
                          ]),
                    ],
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

  // validateHomeInformationTile() {
  //   var isValid = _homeInformationFormKey.currentState.validate();
  //   setState(() {
  //     this.isHomeInformationExpansionTileValid = isValid;
  //   });
  // }

  // VALIDATION OF THE TILE ON COLLAPSE
  // validateHomeInformationOnToggle(bool expanding) {
  //   if (!expanding && _homeInformationFormKey.currentState != null) {
  //     var isValid = _homeInformationFormKey.currentState.validate();
  //     setState(() {
  //       this.isHomeInformationExpansionTileValid = isValid;
  //     });
  //   }
  // }

  dismissKeyboard(bool expanding) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  // VALIDATION OF THE TILE ON COLLAPSE
  // validateStampDutyOnToggle(bool expanding) {
  //   if (!expanding && _stampDutyFormKey.currentState != null) {
  //     var isValid = _stampDutyFormKey.currentState.validate();
  //     setState(() {
  //       this.isStampDutyExpansionTileValid = isValid;
  //     });
  //   }
  // }

  updateValue01(value01) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01 = value01;
      this.hasFormChanged = true;
    });
  }

  updateValue02(value02) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02 = value02;
      this.hasFormChanged = true;
    });
  }

  updateDropDownValue(state) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.state = state;
      this.hasFormChanged = true;
    });
  }

  updatePropertyValue(propertyValue) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue = propertyValue;
      this.hasFormChanged = true;
    });
  }

  updateDepositValue(depositValue) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.userDeposit = depositValue;
      this.hasFormChanged = true;
    });
  }

  updateLoanDurationValue(loanDurationValue) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration = loanDurationValue;
      this.hasFormChanged = true;
    });
  }

  updateBankInterestRateValue(interestRate) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.bankInterestRate = interestRate;
      this.hasFormChanged = true;
    });
  }

  updateSolicitorFee(solicitorFee) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.solicitorFee = solicitorFee;
      this.hasFormChanged = true;
    });
  }

  updatePestAndBuildingFee(pestAndBuildingFee) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.pestAndBuildingFee = pestAndBuildingFee;
      this.hasFormChanged = true;
    });
  }

  updatePropertyType(propertyType) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyType = propertyType;
      this.hasFormChanged = true;
    });
  }

  updateBuildingType(buildingType) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.buildingType = buildingType;
      this.hasFormChanged = true;
    });
  }

  updateIsFirstTimeBuyer(isFirstTimeBuyer) {
    setState(() {
      this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.isFirstTimeBuyer = isFirstTimeBuyer;
      this.hasFormChanged = true;
    });
  }
}
