import 'package:flutter/material.dart';
import 'package:otus_food/data/data.dart';

// виджет отрисовки одной карточки шага приготовления

class MyStep extends StatefulWidget {
  final index;
  final text;
  //List step;
  const MyStep({super.key, required int this.index, required String this.text});

  @override
  State<MyStep> createState() => _MyStepState();
}

class _MyStepState extends State<MyStep> {
  @override
  Widget build(Object context) {
    return Card(
        color: const Color(0xffececec),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              Text(
                '${widget.index + 1}',
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffc2c2c2)),
              )
            ]),
            Flexible(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(widget.text,
                      style: const TextStyle(color: Colors.black)),
                )
              ]),
            ),
            Column(
              children: [
                Row(children: [
                  Checkbox(value: false, onChanged: (_) {}),
                ]),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [Text('02:00')],
                ),
              ],
            )
          ]),
        ));
  }
}

// виджет отрисовки всех шагов приготовления

Widget allStep() {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < stepRecipesSalmon.length; i++) {
    list.add(MyStep(index: i, text: stepRecipesSalmon[i]));
  }
  return Column(children: list);
}
