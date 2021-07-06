import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'alert-dialog.widget.dart';

// class NumberInputWidget extends StatefulWidget {
//   final String inputLabelText;
//   final String inputPrefixText;
//   final String inputSufixText;
//   final String validationText;
//   final Icon icon;
//   final String informationMessage;
//   final TextEditingController controller;

//   const NumberInputWidget(
//       {Key key,
//       this.inputLabelText,
//       this.inputPrefixText,
//       this.inputSufixText,
//       this.validationText,
//       this.icon,
//       this.informationMessage,
//       this.controller})
//       : super(key: key);

//   @override
//   NumberInputWidgetState createState() => NumberInputWidgetState();
// }

// class NumberInputWidgetState extends State<NumberInputWidget> {
//   double inputValue;
//   bool hasBeenTouched = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(child: widget.icon),
//           ),
//           Expanded(
//             flex: 8,
//             child: TextFormField(
//               controller: widget.controller,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               onTap: () => setState(() => hasBeenTouched = true),
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: const OutlineInputBorder(),
//                 labelText: widget.inputLabelText,
//                 prefixText: widget.inputPrefixText,
//                 suffixText: widget.inputSufixText,
//               ),
//               maxLines: 1,
//               validator: (value) {
//                 if (value.isEmpty && widget.validationText != null) {
//                   return widget.validationText;
//                 }
//                 return null;
//               },
//               inputFormatters: [
//                 FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
//               ],
//               onChanged: (val) => setState(() => inputValue = val.isNotEmpty ? double.parse(val) : null),
//             ),
//           ),
//           if (widget.informationMessage != null && widget.informationMessage.isNotEmpty)
//             Expanded(
//               flex: 1,
//               child: IconButton(
//                 color: Theme.of(context).colorScheme.primary,
//                 onPressed: () => showDialog(
//                     context: context,
//                     builder: (_) => AlertDialogWidget(
//                           description: widget.informationMessage,
//                         )),
//                 icon: Icon(
//                   Icons.info_outline,
//                   color: Theme.of(context).accentColor,
//                 ),
//               ),
//             )
//           else
//             Expanded(flex: 1, child: Container())
//         ],
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////

class NumberInputWidgetTest extends StatelessWidget {
  // parameter
  final String inputLabelText;
  final String inputPrefixText;
  final String inputSufixText;
  final String validationText;
  final Icon icon;
  final String informationMessage;
  final TextEditingController controller;

  //callback
  final updateNumberInputValue;
  // final updateTileValidation;

  const NumberInputWidgetTest(
      {Key key,
      this.updateNumberInputValue,
      // this.updateTileValidation,
      this.inputLabelText,
      this.inputPrefixText,
      this.inputSufixText,
      this.validationText,
      this.icon,
      this.informationMessage,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(child: this.icon),
          ),
          Expanded(
            flex: 8,
            child: TextFormField(
              controller: this.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // onTap: () => setState(() => hasBeenTouched = true),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                filled: true,
                border: const OutlineInputBorder(),
                labelText: this.inputLabelText,
                prefixText: this.inputPrefixText,
                suffixText: this.inputSufixText,
              ),
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty && this.validationText != null) {
                  // updateBlockVality(false);
                  return this.validationText;
                }
                // updateBlockVality(true);
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
              ],
              // onChanged: (val) => {updateNumberInputValue(double.parse(val)), updateTileValidation()},
              onChanged: (val) => {updateNumberInputValue(double.parse(val))},
            ),
          ),
          if (this.informationMessage != null && this.informationMessage.isNotEmpty)
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialogWidget(
                          description: this.informationMessage,
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
