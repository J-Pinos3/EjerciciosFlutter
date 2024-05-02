
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);


//inmutable list of colors solo lectura
final colorListProvider = Provider((ref) => colorThemes);

final selectedColorProvider = StateProvider((ref) => 0);




//an AppTheme Object        el estado es un objeto más elaborado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),

);

//controller or notifier
//al this state will handle an instance of AppTheme
class ThemeNotifier extends StateNotifier<AppTheme>{
  //STATE = Estado = new instance of AppTheme()
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkMode(){
    //state.isDarkMode = false; ERROR cuz isDarkMode is final in the AppTheme class
    //new state is the copy of the current state but with another darkmode
    //AND RIVERPOD will notify all widgets
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex( int colorIndex ){
    state = state.copyWith(selectedColor: colorIndex);
  }

}