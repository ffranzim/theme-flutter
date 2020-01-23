import 'package:flutter/material.dart';

import '../dao/app_theme_preferences.dart';
import '../model/enum/app_theme.dart';

class AppThemeProvider with ChangeNotifier {
  AppThemeEnum _appThemeEnum;

  AppThemePreference appThemePreference = AppThemePreference();

  AppThemeEnum get appThemeEnum => _appThemeEnum;

  set appThemeEnum(AppThemeEnum value) {
    _appThemeEnum = AppThemeEnumValue.fromIndex(value.index).appThemeEnum;
    appThemePreference.setAppTheme(value);
    notifyListeners();
  }
}
