import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'alert-dialog.component.dart';

class NumberInputComponent extends StatefulWidget {
  final String inputLabelText;
  final String inputPrefixText;
  final String inputSufixText;
  final String validationText;
  final Icon icon;
  final TextEditingController controller;
  final String informationMessage;

  const NumberInputComponent(
      {Key key,
      this.inputLabelText,
      this.inputPrefixText,
      this.inputSufixText,
      this.validationText,
      this.icon,
      this.controller,
      this.informationMessage})
      : super(key: key);

  @override
  _NumberInputComponentState createState() => _NumberInputComponentState();
}

class _NumberInputComponentState extends State<NumberInputComponent> {
  double _inputValue;

  @override
  void initState() {
    super.initState();
  }

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
            child: TextFormField(
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
                icon: const Icon(Icons.info_outline),
              ),
            )
          else
            Expanded(flex: 1, child: Container())
        ],
      ),
    );
  }
}
