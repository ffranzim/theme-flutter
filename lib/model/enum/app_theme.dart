import 'package:flutter/widgets.dart';

enum AppThemeEnum {
  NuBank,
  BB
}

class AppThemeEnumValue {
  AppThemeEnum appThemeEnum;

  AppThemeEnumValue({@required this.appThemeEnum});

  AppThemeEnumValue.fromIndex(int index) {
    appThemeEnum = AppThemeEnum.values[index];
  }

}