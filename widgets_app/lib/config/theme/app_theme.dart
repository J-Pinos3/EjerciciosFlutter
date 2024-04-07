import 'package:flutter/material.dart';
const Color _customColor = Color(0xff5c11d4);

final List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.yellow,
  Colors.red,
  Colors.pink,
  Colors.black,
  Colors.brown,
  Colors.blueGrey
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):assert(
    selectedColor >= 0 && selectedColor < _colorThemes.length,
    "Selected Color Must be between 0 and ${_colorThemes.length-1}"
    );
  
  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }

}