import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentedInputComponent extends StatefulWidget {
  final String title;
  final Map<int, Widget> mapping;

  SegmentedInputComponent({this.mapping, this.title, Key key})
      : super(key: key);

  @override
  SegmentedInputComponentState createState() => SegmentedInputComponentState();
}

class SegmentedInputComponentState extends State<SegmentedInputComponent> {
  int currentSelection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.title,
                  textScaleFactor: 1.0,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CupertinoSegmentedControl<int>(
                  padding: const EdgeInsets.all(0),
                  selectedColor: Colors.blue,
                  borderColor: Colors.grey,
                  children: widget.mapping,
                  onValueChanged: (int val) {
                    setState(() {
                      currentSelection = val;
                    });
                  },
                  groupValue: currentSelection,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
