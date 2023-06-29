import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.yellow,
  Colors.red
];

class AppTheme{
  final int selectedColorIndex;

  AppTheme({
    this.selectedColorIndex = 0,
  }):assert(selectedColorIndex >= 0 && selectedColorIndex < colorList.length, 'Selected color index is out of range 0 - ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColorIndex],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

}