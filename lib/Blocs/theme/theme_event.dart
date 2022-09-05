

import 'package:meta/meta.dart';
import 'package:unstoppable/Config/theme.dart';
import 'package:unstoppable/Models/model_theme.dart';

@immutable
abstract class ThemeEvent {}

class OnChangeTheme extends ThemeEvent {
  final ThemeModel theme;
  final String font;
   final DarkOption darkOption;

  OnChangeTheme({
    required this.theme,
    required this.font,
    required this.darkOption,
  });
}
