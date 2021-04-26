import 'package:flutter/material.dart';
import 'package:my_home_loan/Routes/router.component.dart';

import '../Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';

class AppDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        )),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(context),
            _createDrawerItem(
                context: context,
                icon: Icons.contacts,
                text: 'New loan calculator',
                onTap: () => Navigator.pushReplacementNamed(
                      context,
                      Routes.loanCalculatorWidget,
                      arguments:
                          new LoanCalculatorResultScreenArgumentsModel(null),
                    )),
            _createDrawerItem(
                context: context,
                icon: Icons.contacts,
                text: 'My collection',
                onTap: () => Navigator.pushReplacementNamed(
                    context, Routes.myCollectionWidget)),
            _createDrawerItem(
                context: context,
                icon: Icons.event,
                text: 'Stamp duty calculator',
                onTap: () => Navigator.pushReplacementNamed(
                    context, Routes.stampDutyCalculatorWidget)),
            Divider(),
            ListTile(
              title: Text('v.1.0.1 - Lambda Dev - All right reserved - ',
                  style: TextStyle(color: Colors.white70, fontSize: 10)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(children: <Widget>[
            Center(
              child: Image(
                image: AssetImage('assets/mainLogo_200x200_noTitle_white.png'),
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
            ),
            Center(
              child: Text("My Oz Loan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500)),
            ),
          ]),
        ));
  }

  Widget _createDrawerItem(
      {BuildContext context,
      IconData icon,
      String text,
      GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
