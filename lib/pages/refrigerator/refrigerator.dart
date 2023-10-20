import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/pages/info_recipes/ingredient_list.dart';
import 'package:otus_food/pages/list_recipes/list_recipes.dart';
import 'package:provider/provider.dart';

class IngredientRefrigerator extends ChangeNotifier {
  final List<String> ingredientName;
  final List<String> ingredientValue;
  final List<int> listRecomendedRecipesIndex = [];

  IngredientRefrigerator(
      {this.ingredientName = const [
        'Соевый соус',
        'Вода',
        'Мёд',
        'Коричневый сахар',
        'Чеснок',
      ],
      this.ingredientValue = const [
        '8 ст. ложек',
        '8 ст. ложек',
        '3 ст. ложки',
        '2 ст. ложки',
      ]});

  void findRecipes() {
    listRecomendedRecipesIndex.clear();

    for (int i = 0; i < myRecipes.length; i++) {
      List<String> ingredients = myRecipes[i].ingredientName;

      bool containsAll = true;
      for (int j = 0; j < ingredientName.length; j++) {
        if (!ingredients.contains(ingredientName[j])) {
          containsAll = false;
          break;
        }
      }

      if (containsAll) {
        listRecomendedRecipesIndex.add(i);
        notifyListeners();
      }
    }
  }
}

// экран

class Refrigerator extends StatelessWidget {
  final IngredientRefrigerator ingredientRefrigerator =
      IngredientRefrigerator();
  Refrigerator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IngredientRefrigerator(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                minimum: const EdgeInsets.fromLTRB(16, 15, 16, 0),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
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
                            listNameIngredient: context
                                .watch<IngredientRefrigerator>()
                                .ingredientName,
                            // ingredientRefrigerator.ingredientName,

                            listValueIngredient: context
                                .watch<IngredientRefrigerator>()
                                .ingredientValue
                            // ingredientRefrigerator.ingredientValue
                            ,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: context.read<IngredientRefrigerator>().findRecipes,
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
              const SizedBox(
                height: 20,
              ),
              // RecomendationIndexRecipes(
              //     recomendationRecipes: 
                  Text('${context
                      .watch<IngredientRefrigerator>()
                      .listRecomendedRecipesIndex}'),
            ],
          ),
        ),
      ),
    );
  }
}

class RecomendationIndexRecipes extends StatelessWidget {
  final List recomendationRecipes;
  const RecomendationIndexRecipes({
    Key? key,
    required this.recomendationRecipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        // context
        //     .watch<IngredientRefrigerator>()
        //     .listRecomendedRecipesIndex
        //     .length,
        recomendationRecipes.length,
        (index) => Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: OneRecipesWidget(
            recipe: OneRecipeIndex(
              index:
                  // context
                  //     .watch<IngredientRefrigerator>()
                  //     .listRecomendedRecipesIndex[index],
                  recomendationRecipes[index],
            ),
          ),
        ),
      ),
    );
  }
}
