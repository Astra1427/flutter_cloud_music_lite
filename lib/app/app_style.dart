import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static ColorScheme lightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );
  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xff3498db),
    brightness: Brightness.dark,
  );
}

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.lightColorScheme.primary),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.lightColorScheme.primary),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.lightColorScheme.primary,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,

    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: AppColors.darkColorScheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: true,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.darkColorScheme.primary),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.darkColorScheme.primary),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.darkColorScheme.primary,
      unselectedLabelColor: Colors.white70,

    ),
  );
}