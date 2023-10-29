import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/widgets/one_recipes_widget.dart';

// разобраться с глобальной

List<int> favoritesData = [];

// список любимых рецептов

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
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: OneRecipesWidget(
                        recipe: OneRecipeIndex(index: favoritesData[index]),
                      ));
                }));
  }
}
