import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otus_food/pages/listRecipes/listRecipes.dart';

class MyStep extends StatefulWidget {
  int index;
  String text;
  //List step;
  MyStep({required int this.index, required String this.text});

  @override
  State<MyStep> createState() => _MyStepState();
}

class _MyStepState extends State<MyStep> {
  @override
  Widget build(Object context) {
    return Card(
        color: Color(0xffececec),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              Text(
                '${this.widget.index}',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffc2c2c2)),
              )
            ]),
            Flexible(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:
                      Text(widget.text, style: TextStyle(color: Colors.black)),
                )
              ]),
            ),
            Column(
              children: [
                Row(children: [
                  Checkbox(value: false, onChanged: (_) {}),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [Text('02:00')],
                ),
              ],
            )
          ]),
        ));
  }
}
