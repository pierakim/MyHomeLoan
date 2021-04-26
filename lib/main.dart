import 'package:flutter/material.dart';
import 'Routes/router.component.dart';
import 'Widgets/home-screen.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getRoute,
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primaryColor: Color(0xff4173CC),
        accentColor: Color(0xff1DA1F3),
      ),
      home: HomeScreenWidget(title: appTitle),
    );
  }
}
