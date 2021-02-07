import 'package:flutter/material.dart';

class DropDownInputComponent extends StatefulWidget {
  final String inputLabelText;
  final Icon icon;
  final String informationMessage;
  DropDownInputComponent(
      {this.inputLabelText, this.icon, this.informationMessage, Key key})
      : super(key: key);

  @override
  DropDownInputComponentState createState() => DropDownInputComponentState();
}

/// This is the private State class that goes with MyStatefulWidget.
class DropDownInputComponentState extends State<DropDownInputComponent> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 1, child: Container(child: widget.icon)),
          Expanded(
            flex: 8,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                border: const OutlineInputBorder(),
                labelText: widget.inputLabelText,
              ),
              isExpanded: true,
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 32,
              onChanged: (val) => updateDropDownValue(val),
              items: <String>[
                'New South Wales',
                'Queensland',
                'South Australia',
                'Tasmania',
                'Victoria',
                'Western Australia'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          if (widget.informationMessage != null &&
              widget.informationMessage.isNotEmpty)
            Expanded(
              flex: 1,
              child: Tooltip(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(40),
                message: widget.informationMessage,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                textStyle: TextStyle(color: Colors.white),
                preferBelow: true,
                verticalOffset: 20,
                child: IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline),
                ),
              ),
            )
          else
            Expanded(flex: 1, child: Container())
        ],
      ),
    );
  }

  void updateDropDownValue(String val) {
    setState(() {
      FocusScope.of(context).requestFocus(new FocusNode());
      dropdownValue = val;
    });
  }
}
