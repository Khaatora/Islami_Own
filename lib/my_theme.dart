import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack = const Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorGold = const Color.fromRGBO(183, 147, 95, 1.0);
  static Color colorWhite = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color colorRed = const Color.fromRGBO(255, 0, 0, 1.0);
  static Color colorDarkBlue = const Color.fromRGBO(20, 26, 46, 1.0);
  static Color colorYellow = const Color.fromRGBO(250, 204, 29, 1.0);

  static ThemeData lightTheme = ThemeData(
      primaryColor: colorGold,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: colorGold,
          onPrimary: colorBlack,
          secondary: colorBlack,
          onSecondary: colorWhite,
          error: colorRed,
          onError: colorWhite,
          background: Colors.transparent,
          onBackground: colorBlack,
          surface: Colors.grey,
          onSurface: colorWhite ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: TextTheme(
          //use headlines for appbar titles or stuff like that
          headline1: TextStyle(
            fontFamily: "El_Messiri",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: colorBlack,
          ),
          //user subtitles for other texts like paragraph texts
          subtitle1: TextStyle(
            fontFamily: 'MonotypeKoufi',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: colorBlack,
          ),
          subtitle2: TextStyle(
            fontFamily: "DecoType_Thuluth",
            fontSize: 25,
            color: colorBlack,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: colorBlack, unselectedItemColor: colorWhite));

  static ThemeData darkTheme = ThemeData(
      primaryColor: colorDarkBlue,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: colorYellow,
          onPrimary: colorWhite,
          secondary: colorDarkBlue,
          onSecondary: colorWhite,
          error: colorRed,
          onError: colorWhite,
          background: Colors.transparent,
          onBackground: colorYellow,
          surface: Colors.grey,
          onSurface: colorWhite ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
        //use headlines for appbar titles or stuff like that
          headline1: TextStyle(
            fontFamily: "El_Messiri",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: colorWhite,
          ),
          //user subtitles for other texts like paragraph texts
          subtitle1: TextStyle(
            fontFamily: 'MonotypeKoufi',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: colorYellow,
          ),
          subtitle2: TextStyle(
            fontFamily:"DecoType_Thuluth",
            fontSize: 25,
            color: colorYellow,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: colorYellow, unselectedItemColor: colorWhite));
}
