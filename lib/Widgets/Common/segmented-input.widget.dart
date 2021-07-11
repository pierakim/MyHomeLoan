import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alert-dialog.widget.dart';

class SegmentedInputWidget extends StatelessWidget {
  // parameter
  final int value;
  final String title;
  final Map<int, Widget> mapping;
  final bool isValid;
  final bool isMandatory;

  //callback
  final updateSegmentedInputValue;

  const SegmentedInputWidget({this.value, this.updateSegmentedInputValue, this.title, this.mapping, this.isValid, this.isMandatory, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 4),
                child: Text(
                  this.title,
                  // textScaleFactor: 1.0,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 10),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CupertinoSegmentedControl<int>(
                  padding: const EdgeInsets.all(0),
                  selectedColor: Theme.of(context).colorScheme.primary,
                  borderColor: Colors.grey,
                  children: this.mapping,
                  onValueChanged: (val) => updateSegmentedInputValue(val),
                  groupValue: value,
                ),
              ),
            ],
          ),
          if (this.isMandatory && this.value == null)
            if (this.isValid != null && !this.isValid)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                    child: Text(
                      "Select a value",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
                ],
              ),
        ],
      ),
    );
  }
}

class SegmentedInputWidgetTest extends StatelessWidget {
  // parameter
  final int value;
  final String title;
  final Map<int, Widget> mapping;
  final bool isValid;
  final bool isMandatory;
  final String informationMessage;
  final Icon icon;

  //callback
  final updateSegmentedInputValue;

  const SegmentedInputWidgetTest(
      {this.value,
      this.updateSegmentedInputValue,
      this.title,
      this.mapping,
      this.isValid,
      this.isMandatory,
      this.informationMessage,
      this.icon,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                  child: Text(
                    this.title,
                    // textScaleFactor: 1.0,
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(child: this.icon),
              ),
              Expanded(
                flex: 8,
                child: CupertinoSegmentedControl<int>(
                  padding: const EdgeInsets.all(0),
                  selectedColor: Theme.of(context).colorScheme.primary,
                  borderColor: Colors.grey,
                  children: this.mapping,
                  onValueChanged: (val) => updateSegmentedInputValue(val),
                  groupValue: value,
                ),
              ),
              if (this.informationMessage != null && this.informationMessage.isNotEmpty)
                Expanded(
                  child: IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialogWidget(
                              description: this.informationMessage,
                            )),
                    icon: Icon(Icons.info_outline, color: Theme.of(context).accentColor),
                  ),
                )
            ],
          ),
          if (this.isMandatory && this.value == null)
            if (this.isValid != null && !this.isValid)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                    child: Text(
                      "Select a value",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
                ],
              ),
        ],
      ),
    );
  }
}
