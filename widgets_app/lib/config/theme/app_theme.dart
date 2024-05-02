import 'package:flutter/material.dart';
const Color _customColor = Color(0xff5c11d4);

final List<Color> colorThemes = [
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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
  }):assert(
    selectedColor >= 0 && selectedColor < colorThemes.length,
    "Selected Color Must be between 0 and ${colorThemes.length-1}"
    );
  
  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorThemes[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }

}