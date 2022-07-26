import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:unstoppable/Blocs/application/application_event.dart';
import 'package:unstoppable/Blocs/application/application_state.dart';
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/theme/theme_bloc.dart';
import 'package:unstoppable/Blocs/theme/theme_event.dart';
import 'package:unstoppable/Config/theme.dart';
import 'package:unstoppable/Models/model_theme.dart';
import 'package:unstoppable/Utils/application.dart';
import 'package:unstoppable/Utils/preferences.dart';
import 'package:unstoppable/Utils/util_preferences.dart';

import '../../app_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(InitialApplicationState());

  @override
  Stream<ApplicationState> mapEventToState(event) async* {
    if (event is OnSetupApplication) {
      ///Pending loading to UI
      yield ApplicationWaiting();


      ///Setup SharedPreferences
      Application.preferences = await SharedPreferences.getInstance();

      ///Get old Theme & Font & Language
      final oldTheme = UtilPreferences.getString(Preferences.theme);
      final oldFont = UtilPreferences.getString(Preferences.font);
      final oldLanguage = UtilPreferences.getString(Preferences.language);
      final oldDarkOption = UtilPreferences.getString(Preferences.darkOption);


      ThemeModel theme;
      String font;
      DarkOption darkOption;

      // ///Setup Language
      // if (oldLanguage != null) {
      //   AppBloc.languageBloc.add(
      //     OnChangeLanguage(Locale(oldLanguage)),
      //   );
      // }

      ///Find font support available
      final fontAvailable = AppTheme.fontSupport.where((item) {
        return item == oldFont;
      }).toList();

      ///Find theme support available
      final themeAvailable = AppTheme.themeSupport.where((item) {
        return item.name == oldTheme;
      }).toList();

      ///Check theme and font available
      if (fontAvailable.isNotEmpty) {
        font = fontAvailable[0];
      }

      if (themeAvailable.isNotEmpty) {
        theme = themeAvailable[0];
      }

      ///check old dark option
      if (oldDarkOption != null) {
        switch (oldDarkOption) {
          case DARK_ALWAYS_OFF:
            darkOption = DarkOption.alwaysOff;
            break;
          case DARK_ALWAYS_ON:
            darkOption = DarkOption.alwaysOn;
            break;
          default:
            darkOption = DarkOption.dynamic;
        }
      }

      ///Setup Theme & Font with dark Option
      AppBloc.themeBloc.add(
        OnChangeTheme(
          theme: AppTheme.currentTheme,
          font:  AppTheme.currentFont,
          darkOption: AppTheme.darkThemeOption,
        ),
      );

      ///Authentication begin check
      AppBloc.authBloc.add(OnAuthCheck());

      ///First or After upgrade version show intro preview app
      // final hasReview = UtilPreferences.containsKey(
      //   '${Preferences.reviewIntro}.${Application.version}',
      // );
      // if (hasReview) {
      //   ///Become app
      //   yield ApplicationSetupCompleted();
      // } else {
      //   ///Pending preview intro
      //   yield ApplicationIntroView();
      // }
    }

    ///Event Completed IntroView
    // if (event is OnCompletedIntro) {
    //   await UtilPreferences.setBool(
    //     '${Preferences.reviewIntro}.${Application.version}',
    //     true,
    //   );

      ///Become app
    //   yield ApplicationSetupCompleted();
    // }


  }
}
