import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/HomeLoanDatarResult.dart';

import '../Common/card-information.component.dart';
import '../Common/dropdown-input.component.dart';
import '../Common/number-input.component.dart';
import '../Common/segmented-input-choices.component.dart';
import '../Common/segmented-input.component.dart';

/// This is the stateful widget that the main application instantiates.
class StampDutyCalculatorComponent extends StatefulWidget {
  StampDutyCalculatorComponent({Key key}) : super(key: key);

  @override
  _StampDutyCalculatorComponentState createState() =>
      _StampDutyCalculatorComponentState();
}

/// This is the private State class that goes with PaymentCalculatorComponent.
class _StampDutyCalculatorComponentState
    extends State<StampDutyCalculatorComponent> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _mortgageValueController;
  TextEditingController _transferFeetValueController;
  TextEditingController _testController;
  // ResidenceType _choice = ResidenceType.PrimaryResidence;

  @override
  void initState() {
    super.initState();
    _mortgageValueController = TextEditingController();
    _transferFeetValueController = TextEditingController();
    _testController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _mortgageValueController.dispose();
    _transferFeetValueController.dispose();
    _testController.dispose();
    super.dispose();
  }

  Map<int, Widget> _residenceType = {
    0: Text('Primary residence'),
    1: Text('Investment residence'),
  };

  Map<int, Widget> _isFirstHomeBuyer = {
    0: Text('Yes'),
    1: Text('No'),
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            CardInformationComponent(
              icon: Icon(Icons.home),
              title: "Stamp duty calculator",
              description:
                  "Stamp duty is a tax on a property transaction that is charged by each state and territory, the amounts can and do vary.\nThe stamp duty rate will depend on factors such as the value of the property, if it is your primary residence and your residency status.",
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NumberInputComponent(
                    icon: Icon(
                      Icons.attach_money,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    inputLabelText: 'Property value',
                    inputPrefixText: '\$ ',
                    inputSufixText: 'AUD',
                    validationText: 'Please enter a value',
                    controller: _mortgageValueController,
                    informationMessage:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in, euismod mollis augue. Curabitur varius ultricies purus vitae venenatis.",
                  ),
                  DropDownInputComponent(
                    inputLabelText: 'Choose a state',
                    icon: Icon(
                      Icons.not_listed_location_outlined,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    informationMessage:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lorem massa. Nulla diam arcu, sodales eu dui in",
                  ),
                  SegmentedInputChoicesComponent(
                      icon: Icon(
                        Icons.foundation,
                        color: Colors.pink,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      informationMessage:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      choices: [
                        SegmentedInputComponent(
                          title: 'Property type',
                          mapping: _residenceType,
                        ),
                      ]),
                  SegmentedInputChoicesComponent(
                      icon: Icon(
                        Icons.roofing,
                        color: Colors.pink,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      informationMessage:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      choices: [
                        SegmentedInputComponent(
                          title: 'Are you first time buyer',
                          mapping: _isFirstHomeBuyer,
                        ),
                      ]),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            form.save();
                            Navigator.pushNamed(
                              context,
                              '/extractArguments',
                              arguments: new PaymentResult(
                                  double.parse(_mortgageValueController.text),
                                  double.parse(
                                      _transferFeetValueController.text)),
                            );
                          }
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 64.0, right: 64.0),
                          child: Text('Tell me!'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
