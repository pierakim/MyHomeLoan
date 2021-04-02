import 'package:flutter/material.dart';

import 'MyCollection/MyCollectionComponent.dart';
import 'app-drawer.component.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyCollectionComponent(), drawer: AppDrawer());
  }
}
