import 'package:flutter/material.dart';

class AppColors {
  final bool isDark = true;

  ThemeData toThemeData() {
    TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    Color txtColor = txtTheme.bodyText1!.color!;

    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: Colors.white,
        onPrimary: txtColor,
        secondary: Colors.white,
        onSecondary: txtColor,
        secondaryContainer: Colors.black,
        onSecondaryContainer: Colors.white,
        surface: Colors.black,
        onSurface: txtColor,
        background: Colors.black,
        onBackground: txtColor,
        error: Colors.red.shade400,
        onError: Colors.white);

    return ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme, useMaterial3: true)
        .copyWith(splashFactory: NoSplash.splashFactory, hintColor: Colors.grey.shade800);
  }
}
