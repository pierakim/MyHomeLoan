import 'package:flutter/material.dart';

Map<int, Widget> isFirstHomeBuyer = {
  // 0: Text('Primary residence'),
  0: Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          'Yes',
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ),
  // 1: Text('Investment residence'),
  1: Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          'No',
          textAlign: TextAlign.center,
        ),
      ),
    ),
  )
};

Map<int, Text> isFirstHomeBuyerForDisplay = {
  0: Text('Yes'),
  1: Text('No'),
};
