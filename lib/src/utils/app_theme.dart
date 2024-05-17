import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    appBarTheme: ThemeData.dark().appBarTheme,
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  );
}
