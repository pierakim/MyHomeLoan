import 'package:flutter/material.dart';
import 'alert-dialog.widget.dart';

class DropDownInputWidget extends StatelessWidget {
  // parameter
  final String value;
  final String inputLabelText;
  final Icon icon;
  final String informationMessage;
  final String validationText;

  //callback
  final updateDropDownValue;

  const DropDownInputWidget({this.updateDropDownValue, this.value, this.inputLabelText, this.icon, this.informationMessage, this.validationText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 1, child: Container(child: icon)),
          Expanded(
            flex: 8,
            child: DropdownButtonFormField<String>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null && validationText != null) {
                  return validationText;
                }
                return null;
              },
              decoration: InputDecoration(
                filled: false,
                border: const OutlineInputBorder(),
                labelText: inputLabelText,
                hintStyle: TextStyle(fontSize: 10.0),
              ),
              isExpanded: true,
              value: value,
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
          if (informationMessage != null && informationMessage.isNotEmpty)
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialogWidget(
                          description: informationMessage,
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
}
