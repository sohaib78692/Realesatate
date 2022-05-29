import 'package:flutter/material.dart';
import 'package:retro/custom/borderbox.dart';
import 'package:retro/utils/constants.dart';

class optionbutton extends StatelessWidget{
  final String text;
  final IconData icon;
  final double width;

  const optionbutton({super.key, required this.text, required this.icon, required this.width});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon( 
      icon: Icon(Icons.map_rounded,size: 20.0,),
      label: Text(text),
      onPressed: (){},
      style: TextButton.styleFrom(
        fixedSize: Size(width, 40),
        primary:Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),) ,
        backgroundColor: COLOR_DARK_BLUE,
        textStyle: TextStyle(color: COLOR_BLACK,fontSize: 12
      )),
    );
  }
}