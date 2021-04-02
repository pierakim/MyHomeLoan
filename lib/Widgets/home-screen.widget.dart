import 'package:flutter/material.dart';

import 'MyCollection/my-collection.widget.dart';
import 'app-drawer.widget.dart';

class HomeScreenWidget extends StatelessWidget {
  final String title;

  HomeScreenWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyCollectionWidget(), drawer: AppDrawerWidget());
  }
}
