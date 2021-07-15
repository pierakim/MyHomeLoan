import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/StampDuty/stamp-duty-calculator-result.model.dart';
import 'package:my_home_loan/Models/Types/building-type.model.dart';
import 'package:my_home_loan/Models/Types/first-time-buyer-type.model.dart';
import 'package:my_home_loan/Models/Types/residence-type.model.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Widgets/Common/card-information.widget.dart';
import 'package:my_home_loan/Widgets/Common/dropdown-input.widget.dart';
import 'package:my_home_loan/Widgets/Common/number-input.widget.dart';
import 'package:my_home_loan/Widgets/Common/segmented-input-choices.widget.dart';
import 'package:my_home_loan/Widgets/Common/segmented-input.widget.dart';

class StampDutyCalculatorCardWidget extends StatefulWidget {
  static const String routeName = '/stampDutyCalculator';

  StampDutyCalculatorCardWidget({Key key}) : super(key: key);

  @override
  _StampDutyCalculatorCardWidgetState createState() => _StampDutyCalculatorCardWidgetState();
}

class _StampDutyCalculatorCardWidgetState extends State<StampDutyCalculatorCardWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _propertyValueController;

  StampDutyCalculatorResultModel stampDutyCalculatorResult;

  bool isPropertyTypeValid = true;
  bool isBuildingTypeValid = true;
  bool isFirstHomeBuyerValid = true;

  // HANDLE STAMP DUTY CALCULATOR SUBMIT - TELL ME
  void _handleSubmitted() {
    final form = _formKey.currentState;
    var formValidationValid = form.validate();

    if (this.stampDutyCalculatorResult.propertyChoice == null) {
      setState(() {
        isPropertyTypeValid = false;
        print('isPropertyTypeValid : false');
      });
    } else
      setState(() {
        isPropertyTypeValid = true;
        print('isPropertyTypeValid : false');
      });

    if (this.stampDutyCalculatorResult.buildingChoice == null) {
      setState(() {
        isBuildingTypeValid = false;
        print('isBuildingTypeValid : false');
      });
    } else
      setState(() {
        isBuildingTypeValid = true;
        print('isBuildingTypeValid : false');
      });

    if (this.stampDutyCalculatorResult.isFirstHomeBuyer == null) {
      setState(() {
        isFirstHomeBuyerValid = false;
        print('isFirstHomeBuyerValid : false');
      });
    } else
      setState(() {
        isFirstHomeBuyerValid = true;
        print('isFirstHomeBuyerValid : false');
      });

    var segmentedValidationValid = isPropertyTypeValid && isBuildingTypeValid && isFirstHomeBuyerValid;

    if (formValidationValid && segmentedValidationValid) {
      print('The form is valid');
      // if form is valid
      form.save();
      Navigator.pushNamed(
        context,
        Routes.stampDutyCalculatorResultWidget,
        arguments: new StampDutyCalculatorResultModel(
            this.stampDutyCalculatorResult.propertyValue,
            this.stampDutyCalculatorResult.state,
            this.stampDutyCalculatorResult.propertyChoice,
            this.stampDutyCalculatorResult.buildingChoice,
            this.stampDutyCalculatorResult.isFirstHomeBuyer),
      );
    }
    print('The form is not valid');
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      this.stampDutyCalculatorResult = new StampDutyCalculatorResultModel(0.0, null, null, null, null);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              // STAMP DUTY INFORMATION CARD
              CardInformationWidget(
                icon: Icon(Icons.home, color: Theme.of(context).accentColor),
                title: "Stamp duty calculator",
                description:
                    "Stamp duty is a tax on a property transaction that is charged by each state and territory, the amounts can and do vary.\nThe stamp duty rate will depend on factors such as the value of the property, if it is your primary residence and your residency status.",
              ),
              // CARD
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DropDownInputWidget(
                          value: this.stampDutyCalculatorResult.state,
                          updateDropDownValue: updateDropDownValue,
                          validationText: 'Select a state',
                          inputLabelText: 'State',
                          icon: Icon(
                            Icons.not_listed_location_outlined,
                            color: Theme.of(context).accentColor,
                            size: 24.0,
                          ),
                          informationMessage:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in",
                        ),
                        NumberInputWidget(
                          controller: _propertyValueController,
                          //value: this.stampDutyCalculatorResult.propertyValue,
                          updateNumberInputValue: updatePropertyValue,
                          icon: Icon(
                            Icons.attach_money,
                            color: Theme.of(context).accentColor,
                            size: 24.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                          inputLabelText: 'Property value',
                          inputPrefixText: '\$ ',
                          inputSufixText: 'AUD',
                          validationText: 'Enter a value',
                          informationMessage:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis.",
                        ),
                        // RESIDENCE TYPE
                        SegmentedInputChoicesWidget(choices: [
                          SegmentedInputWidget(
                            value: this.stampDutyCalculatorResult.propertyChoice,
                            updateSegmentedInputValue: updatePropertyType,
                            title: 'Residence type',
                            mapping: residenceType,
                            isValid: isPropertyTypeValid,
                            isMandatory: true,
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in",
                            icon: Icon(
                              Icons.money,
                              color: Theme.of(context).accentColor,
                              // size: 24.0,
                            ),
                          ),
                        ]),
                        // BUILDING TYPE
                        SegmentedInputChoicesWidget(choices: [
                          SegmentedInputWidget(
                            value: this.stampDutyCalculatorResult.buildingChoice,
                            updateSegmentedInputValue: updateBuildingType,
                            title: 'Building type',
                            mapping: buildingType,
                            isValid: isBuildingTypeValid,
                            isMandatory: true,
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in",
                            icon: Icon(
                              Icons.foundation,
                              color: Theme.of(context).accentColor,
                              // size: 24.0,
                            ),
                          ),
                        ]),
                        // FIRST TIME BUYER
                        SegmentedInputChoicesWidget(choices: [
                          SegmentedInputWidget(
                            value: this.stampDutyCalculatorResult.isFirstHomeBuyer,
                            updateSegmentedInputValue: updateIsFirstTimeBuyer,
                            title: 'Are you first time buyer',
                            mapping: isFirstHomeBuyer,
                            isValid: isFirstHomeBuyerValid,
                            isMandatory: true,
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in",
                            icon: Icon(
                              Icons.family_restroom,
                              color: Theme.of(context).accentColor,
                              // size: 24.0,
                            ),
                          ),
                        ]),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateDropDownValue(state) {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      this.stampDutyCalculatorResult.state = state;
    });
  }

  updatePropertyType(propertyType) {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      this.stampDutyCalculatorResult.propertyChoice = propertyType;
    });
  }

  updateBuildingType(propertyType) {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      this.stampDutyCalculatorResult.buildingChoice = propertyType;
    });
  }

  updateIsFirstTimeBuyer(isFirstTimeBuyer) {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      this.stampDutyCalculatorResult.isFirstHomeBuyer = isFirstTimeBuyer;
    });
  }

  updatePropertyValue(propertyValue) {
    setState(() {
      this.stampDutyCalculatorResult.propertyValue = propertyValue;
    });
  }
}
