import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputComponent extends StatefulWidget {
  final String inputLabelText;
  final String inputPrefixText;
  final String inputSufixText;
  final String validationText;
  final Icon icon;
  final TextEditingController controller;

  const NumberInputComponent(
      {Key key,
      this.inputLabelText,
      this.inputPrefixText,
      this.inputSufixText,
      this.validationText,
      this.icon,
      this.controller})
      : super(key: key);

  @override
  _NumberInputComponentState createState() => _NumberInputComponentState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NumberInputComponentState extends State<NumberInputComponent> {
  double _inputValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
            child: TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                filled: true,
                icon: widget.icon,
                border: const OutlineInputBorder(),
                labelText: widget.inputLabelText,
                prefixText: widget.inputPrefixText,
                suffixText: widget.inputSufixText,
              ),
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty) {
                  return widget.validationText;
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
              ],
              controller: widget.controller,
              onChanged: (val) =>
                  setState(() => _inputValue = double.parse(val)),
            ),
          ),
        ],
      ),
    );
  }
}
