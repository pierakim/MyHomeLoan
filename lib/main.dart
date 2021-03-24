import 'package:flutter/material.dart';
import 'Routes/router.component.dart';
import 'Widgets/home-screen.component.dart';

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
        primaryColor: Colors.lightBlue[600],
        accentColor: Colors.cyan[600],
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}
