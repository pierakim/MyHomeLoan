import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

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
                child: MaterialSegmentedControl(
                  horizontalPadding: const EdgeInsets.all(0.0),
                  children: widget.mapping,
                  selectionIndex: currentSelection,
                  borderColor: Colors.grey,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  unselectedColor: Colors.white,
                  borderRadius: 2.0,
                  onSegmentChosen: (index) {
                    setState(() {
                      currentSelection = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
