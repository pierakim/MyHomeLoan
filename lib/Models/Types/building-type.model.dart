import 'package:flutter/material.dart';

Map<int, Widget> buildingType = {
  // 0: Text('Primary residence'),
  0: Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          'New build',
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
          'Established build',
          textAlign: TextAlign.center,
        ),
      ),
    ),
  )
};

Map<int, Text> buildingTypeForDisplay = {
  // 0: Text('Primary residence'),
  0: Text('New build'),
  // 1: Text('Investment residence'),
  1: Text('Established build'),
};
