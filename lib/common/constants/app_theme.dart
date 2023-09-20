import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary:  Color(0xff571fcd),
    onPrimary: Colors.white,
    primaryContainer: Color(0xffe8ddff),
    onPrimaryContainer: Color(0xff571fcd),
    secondary:  Color(0xff2eaa60),
    onSecondary:  Color(0xffffffff),
    secondaryContainer: Color(0xffd3ffe5),
    onSecondaryContainer: Color(0xff2eaa60),
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Color(0xffa5a5a5),
    surfaceVariant: Color(0xffececec),
    onSurfaceVariant: Color(0xffa5a5a5),
    outline: Color(0xff84838b)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
    ),
    appBarTheme: const AppBarTheme(elevation: 0));
