import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'alert-dialog.component.dart';

class NumberInputComponent extends StatefulWidget {
  final String inputLabelText;
  final String inputPrefixText;
  final String inputSufixText;
  final String validationText;
  final Icon icon;
  final String informationMessage;

  const NumberInputComponent(
      {Key key,
      this.inputLabelText,
      this.inputPrefixText,
      this.inputSufixText,
      this.validationText,
      this.icon,
      this.informationMessage})
      : super(key: key);

  @override
  NumberInputComponentState createState() => NumberInputComponentState();
}

class NumberInputComponentState extends State<NumberInputComponent> {
  double inputValue;
  bool hasBeenTouched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(child: widget.icon),
          ),
          Expanded(
            flex: 8,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: () => setState(() => hasBeenTouched = true),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                filled: true,
                border: const OutlineInputBorder(),
                labelText: widget.inputLabelText,
                prefixText: widget.inputPrefixText,
                suffixText: widget.inputSufixText,
              ),
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty && widget.validationText != null) {
                  return widget.validationText;
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
              ],
              onChanged: (val) => setState(
                  () => inputValue = val.isNotEmpty ? double.parse(val) : null),
            ),
          ),
          if (widget.informationMessage != null &&
              widget.informationMessage.isNotEmpty)
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialogComponent(
                          description: widget.informationMessage,
                        )),
                icon: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          else
            Expanded(flex: 1, child: Container())
        ],
      ),
    );
  }
}
