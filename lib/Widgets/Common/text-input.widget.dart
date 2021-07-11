import 'package:flutter/material.dart';
import 'alert-dialog.widget.dart';

class TextInputWidget extends StatefulWidget {
  final String inputLabelText;
  final String validationText;
  final Icon icon;
  final String informationMessage;
  final TextEditingController controller;

  const TextInputWidget({Key key, this.inputLabelText, this.validationText, this.icon, this.informationMessage, this.controller}) : super(key: key);

  @override
  TextInputWidgetState createState() => TextInputWidgetState();
}

class TextInputWidgetState extends State<TextInputWidget> {
  String inputValue;
  bool hasBeenTouched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
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
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: () => setState(() => hasBeenTouched = true),
              decoration: InputDecoration(
                filled: false,
                border: const OutlineInputBorder(),
                labelText: widget.inputLabelText,
              ),
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty && widget.validationText != null) {
                  return widget.validationText;
                }
                return null;
              },
              onChanged: (val) => setState(() => inputValue = val.isNotEmpty ? val : null),
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
