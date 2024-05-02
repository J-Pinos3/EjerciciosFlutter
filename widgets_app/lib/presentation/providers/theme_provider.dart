
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);


//inmutable list of colors
final colorListProvider = Provider((ref) => colorThemes);

final selectedColorProvider = StateProvider((ref) => 0);