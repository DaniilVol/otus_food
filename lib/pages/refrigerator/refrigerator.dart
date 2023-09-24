import 'package:flutter/material.dart';
import 'package:otus_food/pages/info_recipes/ingredient_list.dart';

class IngredientRefrigerator {
  final List<String> ingredientName;
  final List<String> ingredientValue;

  IngredientRefrigerator(
      {required this.ingredientName, required this.ingredientValue});
}

IngredientRefrigerator listIngredientRefrigerator = IngredientRefrigerator(
    ingredientName: ['b', 'c', 'd'], ingredientValue: ['2', '3', '4']);

// экран

class Refrigerator extends StatelessWidget {
  const Refrigerator({super.key});

/* 
 List<int> recomendationIndexRecipes;
  void recomendationRecipes (){
    myRecipes.
    myRecipes.map((e) => e.ingredientName.contains(listIngredientRefrigerator.ingredientName) ?
    recomendationIndexRecipes.add(value)
    
    )
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 15, 16, 0),
      child: ListView(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              //color: Colors.white,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('В холодильнике',
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff165932))),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: IngredientListWidget(
                          listNameIngredient:
                              listIngredientRefrigerator.ingredientName,
                          listValueIngredient:
                              listIngredientRefrigerator.ingredientValue)),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
                minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 2, 56, 4)),
                elevation: MaterialStateProperty.all(0),
                splashFactory: NoSplash.splashFactory),
            child: const Text(
              'Рекомендовать рецепты',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ));
  }
}
