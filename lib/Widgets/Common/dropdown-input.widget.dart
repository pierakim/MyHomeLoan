import 'package:flutter/material.dart';
import 'alert-dialog.widget.dart';

class DropDownInputWidget extends StatefulWidget {
  final String inputLabelText;
  final Icon icon;
  final String informationMessage;
  final String validationText;

  DropDownInputWidget({this.inputLabelText, this.icon, this.informationMessage, this.validationText, Key key}) : super(key: key);

  @override
  DropDownInputWidgetState createState() => DropDownInputWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class DropDownInputWidgetState extends State<DropDownInputWidget> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 1, child: Container(child: widget.icon)),
          Expanded(
            flex: 8,
            child: DropdownButtonFormField<String>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null && widget.validationText != null) {
                  return widget.validationText;
                }
                return null;
              },
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
                'Western Australia',
                'Australian Capitol Territory',
                'Northern Territory'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          if (widget.informationMessage != null && widget.informationMessage.isNotEmpty)
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialogWidget(
                          description: widget.informationMessage,
                        )),
                icon: Icon(Icons.info_outline, color: Theme.of(context).accentColor),
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
