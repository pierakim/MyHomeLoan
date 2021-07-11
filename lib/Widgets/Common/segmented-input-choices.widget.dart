import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SegmentedInputChoicesWidget extends StatefulWidget {
  final List<Widget> choices;
  SegmentedInputChoicesWidget({this.choices, Key key}) : super(key: key);

  @override
  _SegmentInputChoicesWidgetState createState() => _SegmentInputChoicesWidgetState();
}

class _SegmentInputChoicesWidgetState extends State<SegmentedInputChoicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 8, child: Row(children: widget.choices)),
        ],
      ),
    );
  }
}
