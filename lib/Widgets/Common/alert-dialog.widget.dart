import 'package:flutter/material.dart';

class AlertDialogWidget extends StatefulWidget {
  final String description;

  const AlertDialogWidget({
    Key key,
    this.description,
  }) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        widget.description,
      ),
      actions: [
        TextButton(
          child: Text("Got it"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
