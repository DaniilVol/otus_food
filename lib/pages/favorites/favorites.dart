import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/pages/info_recipes/comments.dart';
import 'package:otus_food/pages/list_recipes/list_recipes.dart';

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

// сердечко в info_recipes

class FavoriteHeart extends StatefulWidget {
  final OneRecipeIndex recipe;

  const FavoriteHeart({required this.recipe, super.key});

  @override
  State<FavoriteHeart> createState() => _FavoriteHeartState();
}

class _FavoriteHeartState extends State<FavoriteHeart> {
  @override
  void initState() {
    favoriteState();
    super.initState();
  }

  MaterialColor? color;
  bool favoriteRecipe = false;

  void favoriteState() {
    for (int ithem in favoritesData) {
      if (OneRecipeIndex(index: ithem).nameRecipes ==
          widget.recipe.nameRecipes) {
        color = Colors.red;
        favoriteRecipe = true;
        break;
      } else {
        color = Colors.grey;
        favoriteRecipe = false;
      }
    }
  }

  void onTapFavorite() {
    favoriteRecipe = !favoriteRecipe;
    if (favoriteRecipe) {
      favoritesData.add(widget.recipe.index);
      color = Colors.red;
    } else {
      favoritesData.remove(widget.recipe.index);
      color = Colors.grey;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onTapFavorite(),
        icon: Icon(
          Icons.favorite,
          size: 40,
          color: color,
        ));
  }
}
