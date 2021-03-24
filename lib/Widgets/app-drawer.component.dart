import 'package:flutter/material.dart';
import 'package:my_home_loan/Routes/router.component.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'New loan calculator',
              onTap: () => Navigator.pushReplacementNamed(
                  context, Routes.paymentCalculator)),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'My collection',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.myCollection)),
          _createDrawerItem(
              icon: Icons.event,
              text: 'Stamp duty calculator',
              onTap: () => Navigator.pushReplacementNamed(
                  context, Routes.stampDutyCalculator)),
          Divider(),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("My Oz Loan",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}