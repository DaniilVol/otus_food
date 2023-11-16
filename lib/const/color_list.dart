import 'package:flutter/material.dart';

enum ColorList {
  main(Color(0xff2ECC71)),
  gray(Color.fromARGB(255, 117, 117, 117)),
  lightBlue(Color(0xFFE8F0FE)),
  darkGreen(Color.fromARGB(255, 2, 56, 4)),
  backgroundLightGray(Color.fromRGBO(236, 236, 236, 1)),
  white(Colors.white),
  black(Colors.black),
  cookingBackGraund(Color.fromARGB(199, 183, 250, 211)),
  cookingNumber(Color.fromRGBO(46, 204, 113, 1)),
  cookingCheckBox(Color.fromRGBO(16, 58, 33, 1)),
  cookingText(Color.fromRGBO(45, 73, 12, 1)),
  ;

  final Color color;

  const ColorList(this.color);
}
