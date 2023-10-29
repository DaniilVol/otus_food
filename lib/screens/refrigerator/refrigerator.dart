import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/providers/ingredient_refrigerator_provider.dart';
import 'package:otus_food/widgets/ingredient_list_widget.dart';
import 'package:otus_food/widgets/one_recipes_widget.dart';
import 'package:provider/provider.dart';

class Refrigerator extends StatelessWidget {
  const Refrigerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              context.watch<IngredientRefrigerator>().name,
                          listValueIngredient:
                              context.watch<IngredientRefrigerator>().value,
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
            RecomendationIndexRecipes(
                recomendationRecipes: context
                    .watch<IngredientRefrigerator>()
                    .listRecomendedRecipesIndex),
          ],
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
        recomendationRecipes.length,
        (index) => Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: OneRecipesWidget(
            recipe: OneRecipeIndex(
              index: recomendationRecipes[index],
            ),
          ),
        ),
      ),
    );
  }
}
