import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SegmentedInputChoicesComponent extends StatefulWidget {
  final Icon icon;
  final List<Widget> choices;
  final String informationMessage;
  SegmentedInputChoicesComponent(
      {this.icon, this.informationMessage, this.choices, Key key})
      : super(key: key);

  @override
  _SegmentInputChoicesComponentState createState() =>
      _SegmentInputChoicesComponentState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SegmentInputChoicesComponentState
    extends State<SegmentedInputChoicesComponent> {
  // ResidenceType _choice = ResidenceType.PrimaryResidence;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 1, child: Container(child: widget.icon)),
          Expanded(
              flex: 8,
              child: Row(
                  mainAxisSize: MainAxisSize.min, children: widget.choices)),
          if (widget.informationMessage != null &&
              widget.informationMessage.isNotEmpty)
            Expanded(
              flex: 1,
              child: Tooltip(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(40),
                message: widget.informationMessage,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                textStyle: TextStyle(color: Colors.white),
                preferBelow: true,
                verticalOffset: 20,
                child: IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline),
                ),
              ),
            )
          else
            Expanded(flex: 1, child: Container())
        ],
      ),
    );
  }

  Widget radio<T>(
    String title,
    T value,
    T groupValue,
    ValueChanged<T> onChanged,
  ) {
    return Flexible(
      child: RadioListTile<T>(
        dense: true,
        contentPadding: EdgeInsets.only(left: 0),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(title),
      ),
    );
  }
}
