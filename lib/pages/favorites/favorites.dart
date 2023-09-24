import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/pages/favorites/favorites_data.dart';
import 'package:otus_food/pages/list_recipes/list_recipes.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoritesData.isEmpty
          ? const Center(
              child: Text(
              'Список пуст',
              style: TextStyle(fontSize: 30),
            ))
          : ListView.builder(
              itemCount: favoritesData.length,
              itemBuilder: (BuildContext buildContext, int index) {
                final recipeImg = myRecipes[favoritesData[index]].imgRecipes;
                final recipeTime = myRecipes[favoritesData[index]].timeRecipes;
                String name = myRecipes[favoritesData[index]].nameRecipes;
                final recipeName = (name.length > 32)
                    ? '${name.characters.take(32)}...'
                    : (name);
                return OneRecipesWidget(
                    recipeImg: recipeImg,
                    recipeName: recipeName,
                    recipeTime: recipeTime,
                    index: favoritesData[index]);
              }),
    );
  }
}
