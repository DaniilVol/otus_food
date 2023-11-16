import 'package:flutter/material.dart';

enum Style {
  labelInfo(TextStyle(fontSize: 16, color: Color(0xff165932))),
  ingredientName(TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
  ingredientValue(TextStyle(
      color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400)),
  ingredientNameOff(
      TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500)),
  ingredientValueOff(
      TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.w400)),
  timeRecipesLightGreen(TextStyle(color: Color(0xff2ECC71))),
  nameRecipesInList(TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
  ;

  final TextStyle textStyle;

  const Style(this.textStyle);
}
