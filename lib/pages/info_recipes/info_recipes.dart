import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/pages/info_recipes/step_recipes.dart';

class Ingredient {
  int index;

  String get name => myRecipes[index]
      .ingNameRecipes
      .fold('', (previousValue, element) => '$previousValue\u2022 $element\n');
  // .reduce((value, element) => '$value\u2022$element\n');
  String get value => myRecipes[index]
      .ingValueRecipes
      .fold('', (previousValue, element) => '$previousValue$element\n');
  //.reduce((value, element) => '$value\n$element');

  Ingredient({required this.index});
}

// экран

class InfoRecipes extends StatelessWidget {
  final int index;
  const InfoRecipes(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('Рецепт'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 216, 216),
        //iconTheme: Theme.of(context).copyWith() ,
      ),
      body: ListView(children: [
        SafeArea(
            minimum: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(
                      myRecipes[index].nameRecipes,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(myRecipes[index].timeRecipes,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff2ECC71),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Image.asset(
                          myRecipes[index].imgRecipes,
                          height: 220,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 22.5,
                ),
                const Row(
                  children: [
                    Text('Ингридиенты',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff165932))),
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Column(
                      children: [
                        Text(Ingredient(index: index).name),
                      ],
                    ),
                    Column(
                      children: [Text(Ingredient(index: index).value)],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
                const Row(
                  children: [
                    Text('Шаги приготовления',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff165932))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: ListStepData(
                          index:
                              index) // передаем индекс выбранного рецепта для создания списка виджетов шагов рецепта
                      .listStepData
                      .map((e) => StepWidget(stepData: e))
                      .toList(),
                )
              ],
            ))
      ]),
    );
  }
}
