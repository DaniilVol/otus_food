import 'package:flutter/material.dart';

enum ColorList {
  main(Color(0xff2ECC71)),
  gray(Color.fromARGB(255, 117, 117, 117)),
  lightBlue(Color(0xFFE8F0FE)),
  darkGeen(Color.fromARGB(255, 2, 56, 4)),
  ;

  final Color color;

  const ColorList(this.color);
}
