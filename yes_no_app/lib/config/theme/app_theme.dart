import 'package:flutter/material.dart';

const Color _customColor = Color(0xff5c11d4);

final List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.yellow,
  Colors.red,
  Colors.black,
  Colors.brown,
  Colors.blueGrey
];


class AppTheme{

  final int selectedColor;
  AppTheme({
    //required this.selectedColor
    this.selectedColor = 0 })
    :assert( selectedColor >= 0 && selectedColor <= _colorThemes.length-1,"Selected Color Must be between 0 and ${_colorThemes.length-1}" )  ;

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark
    );
  }


}