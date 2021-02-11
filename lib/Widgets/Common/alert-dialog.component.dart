import 'package:flutter/material.dart';

class AlertDialogComponent extends StatefulWidget {
  final String description;

  const AlertDialogComponent({
    Key key,
    this.description,
  }) : super(key: key);

  @override
  _AlertDialogComponentState createState() => _AlertDialogComponentState();
}

class _AlertDialogComponentState extends State<AlertDialogComponent> {
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
