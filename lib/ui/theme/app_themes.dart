import 'package:flutter/material.dart';
import 'package:indomic/ui/utils/utils.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: primaryC,
  accentColor: darkPrimaryC,
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    overline: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
    caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
    button: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
    // body
    bodyText1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
    bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
    // subtitle
    subtitle1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400),
    // headline
    headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
    headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
    headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
    headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
    headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
    headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
  ),
);
