import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.brown,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey[900],
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.red,
      textTheme: ButtonTextTheme.primary,
    ),
  );
static ThemeData getTheme(bool isDarkMode){
  return isDarkMode ? darkTheme : lightTheme;
}
}

//      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: isDarkMode ? ThemeMode.dark: ThemeMode.light,