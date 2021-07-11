import 'package:flutter/material.dart';

class TextDisplayWidget extends StatefulWidget {
  final String labelText;
  final String prefixText;
  final String suffixText;
  final Icon icon;
  final TextEditingController controller;

  const TextDisplayWidget({Key key, this.labelText, this.prefixText, this.suffixText, this.icon, this.controller})
      : super(key: key);

  @override
  TextDisplayWidgetState createState() => TextDisplayWidgetState();
}

class TextDisplayWidgetState extends State<TextDisplayWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: widget.icon,
            ),
            Expanded(
              child: TextField(
                // style: TextStyle(fontSize: 15.0),
                readOnly: true,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 10.0),
                  prefixText: widget.prefixText,
                  suffixText: widget.suffixText,
                  border: InputBorder.none,
                  filled: false,
                  labelText: widget.labelText,
                ),
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}
