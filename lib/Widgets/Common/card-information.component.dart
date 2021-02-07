import 'package:flutter/material.dart';

class CardInformationComponent extends StatefulWidget {
  final Icon icon;
  final String title;
  final String description;

  const CardInformationComponent({
    Key key,
    this.title,
    this.icon,
    this.description,
  }) : super(key: key);

  @override
  _CardInformationComponentState createState() =>
      _CardInformationComponentState();
}

class _CardInformationComponentState extends State<CardInformationComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: widget.icon,
              title: Text(widget.title),
              subtitle: Text(widget.description),
            ),
          ],
        ),
      ),
    );
  }
}
