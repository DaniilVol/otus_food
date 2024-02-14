import 'package:flutter/material.dart';
import 'package:otus_food/const/style.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/screens/info_recipes/info_recipes.dart';

// виджет одного рецепта в списке рецептов

class OneRecipesWidget extends StatelessWidget {
  final OneRecipeIndex recipe;
  const OneRecipesWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InfoRecipes(recipe: recipe),
          ));
        },
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      recipe.imgRecipes,
                      width: 149,
                      height: 145,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(recipe.nameRecipesShort,
                        style: Style.nameRecipesInList.textStyle),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          recipe.timeRecipes,
                          style: Style.timeRecipesLightGreen.textStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
