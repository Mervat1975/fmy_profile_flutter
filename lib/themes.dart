import 'package:flutter/material.dart';

class MyThemes {
  static const primary = Color.fromARGB(255, 109, 10, 43);
  static const primaryColor = Color.fromARGB(255, 146, 15, 59);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 207, 129, 129),
    primaryColorDark: primaryColor,
    colorScheme: const ColorScheme.dark(primary: primary),
    dividerColor: const Color.fromARGB(255, 107, 3, 3),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(primary: primary),
    dividerColor: const Color.fromARGB(255, 139, 22, 22),
  );
}
