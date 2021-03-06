import 'package:flutter/material.dart';

Map<int, Widget> residenceType = {
  // 0: Text('Primary residence'),
  0: Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          'Primary',
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
          'Investment',
          textAlign: TextAlign.center,
        ),
      ),
    ),
  )
};

Map<int, Text> residenceTypeForDisplay = {
  // 0: Text('Primary residence'),
  0: Text('Primary'),
  // 1: Text('Investment residence'),
  1: Text('Investment'),
};
