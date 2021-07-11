import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'alert-dialog.widget.dart';

class SegmentedInputChoicesWidget extends StatefulWidget {
  final Icon icon;
  final List<Widget> choices;
  final String informationMessage;
  SegmentedInputChoicesWidget({this.icon, this.informationMessage, this.choices, Key key}) : super(key: key);

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
          Expanded(flex: 1, child: Container(child: widget.icon)),
          Expanded(flex: 8, child: Row(children: widget.choices)),
          if (widget.informationMessage != null && widget.informationMessage.isNotEmpty)
            Expanded(
              child: IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialogWidget(
                          description: widget.informationMessage,
                        )),
                icon: Icon(Icons.info_outline, color: Theme.of(context).accentColor),
              ),
            )
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
///
///

class SegmentedInputChoicesWidgetTest extends StatefulWidget {
  final List<Widget> choices;
  SegmentedInputChoicesWidgetTest({this.choices, Key key}) : super(key: key);

  @override
  _SegmentInputChoicesWidgetStateTest createState() => _SegmentInputChoicesWidgetStateTest();
}

class _SegmentInputChoicesWidgetStateTest extends State<SegmentedInputChoicesWidgetTest> {
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
