import 'package:flutter/material.dart';

class ThemeAndColor {
  static const Color themeColor = Color(0xff096799);

  static const Map<int, Color> themeMapColor = {
    50: Color.fromRGBO(9, 103, 153, .1),
    100: Color.fromRGBO(9, 103, 153, .2),
    200: Color.fromRGBO(9, 103, 153, .3),
    300: Color.fromRGBO(9, 103, 153, .4),
    400: Color.fromRGBO(9, 103, 153, .5),
    500: Color.fromRGBO(9, 103, 153, .6),
    600: Color.fromRGBO(9, 103, 153, .7),
    700: Color.fromRGBO(9, 103, 153, .8),
    800: Color.fromRGBO(9, 103, 153, .9),
    900: Color.fromRGBO(9, 103, 153, 1),
  };

  static const List<Color> starColorList = [
    Color(0xffFF5C6B),
    Color(0xffDBB049),
    Color(0xff7A5AB5),
    Color(0xff00D099),
    Color(0xff0094D4),
    Color(0xFFff9933),
  ];

  static Color greyColor = Colors.grey;
  static Color whiteColor = Colors.white;

  static final appTheme = ThemeData(
      primarySwatch: const MaterialColor(0xff096799, themeMapColor),
      fontFamily: 'ubuntu',
      canvasColor: Colors.transparent,
      textTheme: const TextTheme(
        headline1: TextStyle(fontFamily: "ubuntu"),
        headline2: TextStyle(fontFamily: "ubuntu"),
        headline3: TextStyle(fontFamily: "ubuntu"),
        headline4: TextStyle(fontFamily: "ubuntu"),
        headline5: TextStyle(fontFamily: "ubuntu"),
        headline6: TextStyle(fontFamily: "ubuntu"),
        subtitle1: TextStyle(fontFamily: "ubuntu"),
        subtitle2: TextStyle(fontFamily: "ubuntu"),
        bodyText1: TextStyle(fontFamily: "ubuntu"),
        bodyText2: TextStyle(fontFamily: "ubuntu"),
        caption: TextStyle(fontFamily: "ubuntu"),
        button: TextStyle(fontFamily: "ubuntu"),
        overline: TextStyle(fontFamily: "ubuntu"),
      ));
}
