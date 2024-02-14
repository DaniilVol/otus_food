import 'package:flutter/material.dart';
import 'package:otus_food/const/color_list.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/providers/favorit_data_provider.dart';
import 'package:otus_food/widgets/one_recipes_widget.dart';
import 'package:provider/provider.dart';

// список любимых рецептов

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorList.backgroundLightGray.color,
        body: context.read<FavoriteData>().favoritesData.isEmpty
            ? const Center(
                child: Text(
                'Список пуст',
                style: TextStyle(fontSize: 30),
              ))
            : ListView.builder(
                itemCount: context.watch<FavoriteData>().favoritesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: OneRecipesWidget(
                        recipe: OneRecipeIndex(
                            index: context
                                .read<FavoriteData>()
                                .favoritesData[index]),
                      ));
                }));
  }
}
