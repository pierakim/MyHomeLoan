import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class SegmentedInputWidget extends StatefulWidget {
//   final String title;
//   final Map<int, Widget> mapping;
//   final bool isValid;
//   final bool isMandatory;
//   final bool isFormPristine;

//   SegmentedInputWidget({this.title, this.mapping, this.isValid, this.isMandatory, this.isFormPristine, Key key})
//       : super(key: key);

//   @override
//   SegmentedInputWidgetState createState() => SegmentedInputWidgetState();
// }

// class SegmentedInputWidgetState extends State<SegmentedInputWidget> {
//   int currentSelection;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 4),
//                 child: Text(
//                   widget.title,
//                   textScaleFactor: 1.0,
//                   style: TextStyle(color: Theme.of(context).colorScheme.primary),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: CupertinoSegmentedControl<int>(
//                   padding: const EdgeInsets.all(0),
//                   selectedColor: Theme.of(context).colorScheme.primary,
//                   borderColor: Colors.grey,
//                   children: widget.mapping,
//                   onValueChanged: (int val) {
//                     setState(() {
//                       currentSelection = val;
//                     });
//                   },
//                   groupValue: currentSelection,
//                 ),
//               ),
//             ],
//           ),
//           if (this.widget.isMandatory && this.currentSelection == null)
//             if (this.widget.isValid != null && !this.widget.isValid)
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15.0, top: 8.0),
//                     child: Text(
//                       "Select a value",
//                       style: TextStyle(color: Colors.red, fontSize: 12),
//                     ),
//                   )
//                 ],
//               ),
//         ],
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////
class SegmentedInputWidgetTest extends StatelessWidget {
  // parameter
  final int value;
  final String title;
  final Map<int, Widget> mapping;
  final bool isValid;
  final bool isMandatory;

  //callback
  final updateSegmentedInputValue;

  const SegmentedInputWidgetTest(
      {this.value, this.updateSegmentedInputValue, this.title, this.mapping, this.isValid, this.isMandatory, Key key})
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
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  this.title,
                  textScaleFactor: 1.0,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
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
                  // onValueChanged: (int val) {
                  //   setState(() {
                  //     currentSelection = val;
                  //   });
                  // },
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
