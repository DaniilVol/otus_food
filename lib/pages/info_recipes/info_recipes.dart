import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/pages/info_recipes/step_recipes.dart';

/* class IngredientWidget2 {
  int index;

  String get name => myRecipes[index]
      .ingNameRecipes
      .fold('', (previousValue, element) => '$previousValue\u2022 $element\n');
  // .reduce((value, element) => '$value\u2022$element\n');
  String get value => myRecipes[index]
      .ingValueRecipes
      .fold('', (previousValue, element) => '$previousValue$element\n');
  //.reduce((value, element) => '$value\n$element');

  IngredientWidget2({required this.index});
} */

abstract class ListIngredient {
  Widget list();
}

class ListIngredientName {
  int index;
  final List<String> _name = myRecipes[index].ingNameRecipes;
  List<Widget> listIngredientNameData = [];
  List get name => _name.map((e) => '\u2022 $e}').toList();

  ListIngredientName({required this.index});
}

class ListIngredientValue extends ListIngredient {
  int index;

  ListIngredientValue({required this.index});

  @override
  Widget list() {
    List<String> value = myRecipes[index].ingValueRecipes;
    List<Widget> listIngredientValueData = [];
    for (int i = 0; i < value.length; i++) {
      listIngredientValueData.add(Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(value[i]))
        ],
      ));
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listIngredientValueData.map((e) => e).toList());
  }
}

class IngredientListWidget extends StatelessWidget {
  int index;
  IngredientListWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      verticalDirection: VerticalDirection.up,
      children: [
        Column(
          children: ListIngredientName(index: index)
              .list()
              .map((text) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(text),
                  ))
              .toList(),
        ),
        Column(
          children: [],
        ),
      ],
    );
  }
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
                IngredientListWidget(index: index),
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
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                      minimumSize:
                          MaterialStateProperty.all(const Size(300, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 2, 56, 4)),
                      elevation: MaterialStateProperty.all(0),
                      splashFactory: NoSplash.splashFactory),
                  child: const Text(
                    'Начать готовить',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
