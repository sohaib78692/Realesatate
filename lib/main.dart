import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:retro/utils/constants.dart';
import 'package:retro/screens/landing.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    double screenwidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      theme: ThemeData(textTheme: screenwidth<500? TEXT_THEME_SMALL: TEXT_THEME_DEFAULT, fontFamily: "Montserrat" ,colorScheme: ColorScheme.fromSwatch().copyWith(primary: COLOR_WHITE, secondary: COLOR_DARK_BLUE) ),
      home:landing(),
      );
  }
  }
