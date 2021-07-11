import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/Types/building-type.model.dart';
import 'package:my_home_loan/Models/Types/first-time-buyer-type.model.dart';
import 'package:my_home_loan/Models/Types/residence-type.model.dart';
import 'package:my_home_loan/Models/StampDuty/stamp-duty-calculator-result.model.dart';
import 'package:my_home_loan/Widgets/Common/text-display.widget.dart';

class StampDutyCalculatorResultWidget extends StatefulWidget {
  static const String routeName = '/stampDutyCalculatorResult';

  StampDutyCalculatorResultWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StampDutyCalculatorResultWidgetState();
}

class _StampDutyCalculatorResultWidgetState extends State<StampDutyCalculatorResultWidget> {
  @override
  Widget build(BuildContext context) {
    // ROUTE ARGUMENT
    final StampDutyCalculatorResultModel args = ModalRoute.of(context).settings.arguments;

    // PARAMETERS TO CONTROLLER
    final _propertyValueController = TextEditingController(text: args.propertyValue.toString());
    final _stateController = TextEditingController(text: args.state.toString());
    final _residenceTypeController = TextEditingController(text: residenceTypeForDisplay[args.propertyChoice].data);
    final _buildingTypeController = TextEditingController(text: buildingTypeForDisplay[args.buildingChoice].data);
    final _firstHomeBuyerController = TextEditingController(text: isFirstHomeBuyerForDisplay[args.propertyChoice].data);
    final _resultController = TextEditingController(text: '\$ ' + args.result.toString());

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit your data'),
        ),
        body: ListView(
          children: <Widget>[
            // INPUT SUMMARY: PROPERTY VALUE + STATE + FIRST TIME BUYYER + PROPERTY TYPE
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextDisplayWidget(
                            icon: Icon(
                              Icons.attach_money,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20.0,
                            ),
                            controller: _propertyValueController,
                            labelText: "Property value",
                            prefixText: "\$",
                            suffixText: ' AUD',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextDisplayWidget(
                            icon: Icon(
                              Icons.not_listed_location_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20.0,
                            ),
                            controller: _stateController,
                            labelText: "State",
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextDisplayWidget(
                            icon: Icon(
                              Icons.foundation,
                              color: Colors.pink,
                              size: 20.0,
                            ),
                            controller: _firstHomeBuyerController,
                            labelText: "First time buyer",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextDisplayWidget(
                            icon: Icon(
                              Icons.not_listed_location_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20.0,
                            ),
                            controller: _residenceTypeController,
                            labelText: "Property type",
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextDisplayWidget(
                            icon: Icon(
                              Icons.not_listed_location_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20.0,
                            ),
                            controller: _buildingTypeController,
                            labelText: "Building type",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // RESULT SECTION
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Text('Stamp duty fee'),
                        subtitle: Text('blablabla blabla bla blablabla'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller: _resultController,
                              decoration: InputDecoration(
                                suffixText: ' AUD',
                                border: InputBorder.none,
                                filled: false,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
