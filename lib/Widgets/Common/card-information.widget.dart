import 'package:flutter/material.dart';
import 'alert-dialog.widget.dart';

class CardInformationWidget extends StatefulWidget {
  final Icon icon;
  final String title;
  final String description;

  const CardInformationWidget({
    Key key,
    this.title,
    this.icon,
    this.description,
  }) : super(key: key);

  @override
  _CardInformationWidgetState createState() => _CardInformationWidgetState();
}

class _CardInformationWidgetState extends State<CardInformationWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 9,
              child: ListTile(
                leading: widget.icon,
                title: Text(widget.title),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialogWidget(
                          description: widget.description,
                        )),
                icon: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
