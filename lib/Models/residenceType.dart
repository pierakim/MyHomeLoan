import 'package:flutter/material.dart';

Map<int, Widget> residenceType = {
  // 0: Text('Primary residence'),
  0: Container(
    child: Center(
      child: Text(
        'Primary residence',
        textAlign: TextAlign.center,
      ),
    ),
  ),
  // 1: Text('Investment residence'),
  1: Container(
    child: Center(
      child: Text(
        'Investment residence',
        textAlign: TextAlign.center,
      ),
    ),
  )
};

Map<int, Text> residenceTypeForDisplay = {
  // 0: Text('Primary residence'),
  0: Text('Primary residence'),
  // 1: Text('Investment residence'),
  1: Text('Investment residence'),
};
