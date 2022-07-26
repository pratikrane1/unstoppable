import 'package:flutter/material.dart';
import 'package:unstoppable/config/theme_collection.dart';

import '../Models/model_theme.dart';


enum DarkOption { dynamic, alwaysOn, alwaysOff }

class AppTheme {
  ///Optional Color
  static Color blueColor = Color.fromRGBO(93, 173, 226, 1);
  static Color pinkColor = Color.fromRGBO(165, 105, 189, 1);
  static Color greenColor = Color.fromRGBO(88, 214, 141, 1);
  static Color yellowColor = Color.fromRGBO(253, 198, 10, 1);
  static Color kashmirColor = Color.fromRGBO(93, 109, 126, 1);
  static Color greenDarkColor = Color.fromRGBO(3, 80, 43, 1);
  static Color facebookColor=Color(0xFF3B5998);
  static Color googleColor=Color(0xFFEF1C1C);
  static Color phoneColor=Color(0xFF19B3FE);
  static Color textColor=Color(0xFF085775);
  static Color verifyPhone=Color(0xFFFFD8BC);
  static Color bgColor=Color(0xFF00000029);
  static Color appColor=Color(0xffDF5F00);

  ///Default font
  static String currentFont = "Poppins";

  ///List Font support
  static List<String> fontSupport = ["Raleway", "Roboto", "Merriweather"];

  ///Default Theme
  static ThemeModel currentTheme = ThemeModel.fromJson({
    "name": "darkorange",
    "color": Color(0xffDF5F00),
    "light": "primaryLight",
    "dark": "primaryDark",
  });

  ///List Theme Support in Application
  static List themeSupport = [
    {
      "name": "default",
      // "color": Color(0xff03502B),
      "color": Color(0xffDF5F00),
      "light": "primaryLight",
      "dark": "primaryDark",
    },
    {
      "name": "brown",
      "color": Color(0xffa0877e),
      "light": "brownLight",
      "dark": "brownDark",
    },
    {
      "name": "blue",
      "color": Color(0xff0172BE),
      "light": "pinkLight",
      "dark": "pinkDark",
    },
    {
      "name": "orange",
      "color": Color(0xfff6bb41),
      "light": "pastelOrangeLight",
      "dark": "pastelOrangeDark",
    },
    {
      "name": "green",
      "color": Color(0xff93b7b0),
      "light": "greenLight",
      "dark": "greenDark",
    },
  ].map((item) => ThemeModel.fromJson(item)).toList();

  ///Dark Theme option
  static DarkOption darkThemeOption = DarkOption.dynamic;

  static ThemeData lightTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.lightTheme,
  );

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static ThemeData darkTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.darkTheme,
  );

  ///Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}
