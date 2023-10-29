import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/widgets/one_recipes_widget.dart';

class ListRecipesWidget extends StatelessWidget {
  const ListRecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: myRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: OneRecipesWidget(
                recipe: OneRecipeIndex(index: index),
              ),
            );
          }),
    );
  }
}
