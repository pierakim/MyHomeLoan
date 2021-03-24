import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/ResidenceType.dart';
import 'package:my_home_loan/Models/first-time-buyer-type.dart';
import 'package:my_home_loan/Models/stamp-duty-calculator-result.dart';
import 'package:my_home_loan/Routes/router.component.dart';

import '../Common/card-information.component.dart';
import '../Common/dropdown-input.component.dart';
import '../Common/number-input.component.dart';
import '../Common/segmented-input-choices.component.dart';
import '../Common/segmented-input.component.dart';
import '../app-drawer.component.dart';

/// This is the stateful widget that the main application instantiates.
class StampDutyCalculatorComponent extends StatefulWidget {
  static const String routeName = '/stampDutyCalculator';

  StampDutyCalculatorComponent({Key key}) : super(key: key);

  @override
  _StampDutyCalculatorComponentState createState() =>
      _StampDutyCalculatorComponentState();
}

class _StampDutyCalculatorComponentState
    extends State<StampDutyCalculatorComponent> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<DropDownInputComponentState> _australianStateKey =
      GlobalKey();

  final GlobalKey<NumberInputComponentState> _propertyValueStateKey =
      GlobalKey();

  final GlobalKey<SegmentedInputComponentState> _propertyTypeKey = GlobalKey();
  final GlobalKey<SegmentedInputComponentState> _firstHomeBuyerKey =
      GlobalKey();

  final _propertyValueController = TextEditingController();

  // init  model
  StampDutyCalculatorResult stampDutyCalculatorResult =
      StampDutyCalculatorResult(0.0, '', 0, 0);

  bool isPropertyTypeValid;
  bool isFirstHomeBuyerValid;

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {}
    if (_propertyTypeKey.currentState.currentSelection == null) {
      isPropertyTypeValid = false;
    }
    if (_firstHomeBuyerKey.currentState.currentSelection == null) {
      isFirstHomeBuyerValid = false;
    } else {
      form.save();
      Navigator.pushNamed(
        context,
        Routes.stampDutyCalculatorResult,
        arguments: new StampDutyCalculatorResult(
            _propertyValueStateKey.currentState.inputValue,
            _australianStateKey.currentState.dropdownValue,
            _propertyTypeKey.currentState.currentSelection,
            _firstHomeBuyerKey.currentState.currentSelection),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    _propertyValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stamp duty calculator"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                CardInformationComponent(
                  icon: Icon(Icons.home),
                  title: "Stamp duty calculator",
                  description:
                      "Stamp duty is a tax on a property transaction that is charged by each state and territory, the amounts can and do vary.\nThe stamp duty rate will depend on factors such as the value of the property, if it is your primary residence and your residency status.",
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // **************
                          // STATE
                          // **************
                          DropDownInputComponent(
                            key: _australianStateKey,
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
                          // **************
                          // PROPERTY VALUE
                          // **************
                          NumberInputComponent(
                            key: _propertyValueStateKey,
                            icon: Icon(
                              Icons.attach_money,
                              color: Theme.of(context).accentColor,
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            inputLabelText: 'Property value',
                            inputPrefixText: '\$ ',
                            inputSufixText: 'AUD',
                            validationText: 'Enter a value',
                            informationMessage:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis.",
                          ),
                          // **************
                          // PROPERTY TYPE
                          // **************
                          SegmentedInputChoicesComponent(
                              icon: Icon(
                                Icons.foundation,
                                color: Theme.of(context).accentColor,
                                size: 24.0,
                              ),
                              informationMessage:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              choices: [
                                SegmentedInputComponent(
                                  key: _propertyTypeKey,
                                  title: 'Property type',
                                  mapping: residenceType,
                                  isValid: isPropertyTypeValid,
                                ),
                              ]),
                          // **************
                          // FIRST TIME BUYER
                          // **************
                          SegmentedInputChoicesComponent(
                              icon: Icon(
                                Icons.roofing,
                                color: Theme.of(context).accentColor,
                                size: 24.0,
                              ),
                              informationMessage:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              choices: [
                                SegmentedInputComponent(
                                  key: _firstHomeBuyerKey,
                                  title: 'Are you first time buyer',
                                  mapping: isFirstHomeBuyer,
                                  isValid: isFirstHomeBuyerValid,
                                ),
                              ]),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: _handleSubmitted,
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
        ),
      ),
    );
  }
}
