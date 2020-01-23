import 'package:shared_preferences/shared_preferences.dart';

import '../model/enum/app_theme.dart';

class AppThemePreference {
  static const THEME_STATUS = "APP_THEME_STATUS";

  setAppTheme(AppThemeEnum appThemeEnum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(THEME_STATUS, appThemeEnum.index);
  }

  Future<AppThemeEnum> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int valuePrefs = prefs.getInt(THEME_STATUS);
    return AppThemeEnumValue.fromIndex(valuePrefs).appThemeEnum;
  }
}
