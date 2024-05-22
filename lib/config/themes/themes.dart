import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData(
    primarySwatch: const MaterialColor(
      0xff9ca382,
      <int, Color>{
        50: Color(0xff9ca382),
        100: Color(0xff9ca382),
        200: Color(0xff9ca382),
        300: Color(0xff9ca382),
        400: Color(0xff9ca382),
        500: Color(0xff9ca382),
        600: Color(0xff9ca382),
        700: Color(0xff9ca382),
        800: Color(0xff9ca382),
        900: Color(0xff9ca382),
      },
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff9ca382),
    ),
    appBarTheme: AppBarTheme(
      titleSpacing: 18,
      iconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: HexColor('333739')),
      elevation: 0,
      backgroundColor: HexColor('333739'),
      titleTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff9ca382),
      backgroundColor: Color(0xff9ca382),
      elevation: 20,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: HexColor('333739'),
  );
  static ThemeData lightMode = ThemeData(
    fontFamily: 'Jannah',
  );
}
