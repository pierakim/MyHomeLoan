import 'package:flutter/material.dart';
import 'package:my_home_loan/Models/first-time-buyer-type.dart';
import 'package:my_home_loan/Models/residenceType.dart';
import 'package:my_home_loan/Models/stamp-duty-calculator-result.dart';

class StampDutyCalculatorResultComponent extends StatefulWidget {
  StampDutyCalculatorResultComponent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _StampDutyCalculatorResultComponentState();
}

class _StampDutyCalculatorResultComponentState
    extends State<StampDutyCalculatorResultComponent> {
  @override
  Widget build(BuildContext context) {
    final StampDutyCalculatorResult args =
        ModalRoute.of(context).settings.arguments;

    final _propertyValueController =
        TextEditingController(text: args.propertyValue.toString());

    // state input data
    final _stateController = TextEditingController(text: args.state.toString());

    final _residenceTypeController = TextEditingController(
        text: residenceTypeForDisplay[args.propertyChoice].data);

    final _firstHomeBuyerController = TextEditingController(
        text: isFirstHomeBuyerForDisplay[args.propertyChoice].data);

    // The result
    final _resultController =
        TextEditingController(text: '\$ ' + args.result.toString());

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit your data'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.pink,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                      controller: _propertyValueController,
                                      decoration: InputDecoration(
                                        prefixText: "\$",
                                        suffixText: ' AUD',
                                        border: InputBorder.none,
                                        filled: false,
                                        labelText: "Property value",
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          )),
                        ),
                        Expanded(
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.not_listed_location_outlined,
                                    color: Colors.pink,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                      controller: _stateController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: false,
                                        labelText: "State",
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.roofing,
                                    color: Colors.pink,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                      controller: _firstHomeBuyerController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: false,
                                        labelText: "First time buyer",
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          )),
                        ),
                        Expanded(
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.foundation,
                                    color: Colors.pink,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                      controller: _residenceTypeController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: false,
                                        labelText: "Property type",
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
