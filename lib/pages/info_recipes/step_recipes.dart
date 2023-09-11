import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';

// виджет отрисовки одной карточки шага приготовления

class MyStep extends StatefulWidget {
  final idStep;
  final idRecipe;
  const MyStep(
      {super.key, required int this.idStep, required int this.idRecipe});

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
                '${widget.idStep + 1}',
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
                  child: Text(
                      myRecipes[widget.idRecipe].stepRecipes[widget
                          .idStep], // выбираем из списка нужный рецепт и нужный шаг
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
                Row(
                  children: [
                    Text(myRecipes[widget.idRecipe].stepTimeRecipes[widget
                            .idStep] // берем из списка рецептов, время шага
                        )
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}

// виджет отрисовки всех шагов приготовления

Widget allStep(int index) {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < myRecipes[index].stepRecipes.length; i++) {
    list.add(MyStep(
      // передаем в список виджет с новым шагом приготовления
      idStep: i,
      idRecipe: index,
    ));
  }
  return Column(children: list);
}
