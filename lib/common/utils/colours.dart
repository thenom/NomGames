import 'package:flutter/material.dart';

// Original colour values
//const Map<int, Color> primarySwatch = {
  //50: Color.fromRGBO(255, 207, 68, .1),
  //100: Color.fromRGBO(255, 207, 68, .2),
  //200: Color.fromRGBO(255, 207, 68, .3),
  //300: Color.fromRGBO(255, 207, 68, .4),
  //400: Color.fromRGBO(255, 207, 68, .5),
  //500: Color.fromRGBO(255, 207, 68, .6),
  //600: Color.fromRGBO(255, 207, 68, .7),
  //700: Color.fromRGBO(255, 207, 68, .8),
  //800: Color.fromRGBO(255, 207, 68, .9),
  //900: Color.fromRGBO(255, 207, 68, 1),
//};
//const MaterialColor primaryColor = MaterialColor(0xFFFFCF44, primarySwatch);

// My colour values from https://github.com/mbitson/mcg
const MaterialColor primaryColor = MaterialColor(_primarycolorPrimaryValue, <int, Color>{
  50: Color(0xFFE3EAEB),
  100: Color(0xFFB8CACE),
  200: Color(0xFF89A7AE),
  300: Color(0xFF5A848D),
  400: Color(0xFF366974),
  500: _primarycolorPrimaryValue,
  600: Color(0xFF114854),
  700: Color(0xFF0E3F4A),
  800: Color(0xFF0B3641),
  900: Color(0xFF062630),
});
const int _primarycolorPrimaryValue = Color(0xFF134F5C);

const int primaryColorDark = 0xFFFD9725;
