import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/providers/favorit_data_provider.dart';
import 'package:provider/provider.dart';

// виджет сердечко - избранное

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
    for (int ithem in context.read<FavoriteData>().favoritesData) {
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
      context.read<FavoriteData>().add(widget.recipe.index);
      color = Colors.red;
    } else {
      context.read<FavoriteData>().remove(widget.recipe.index);
      color = Colors.grey;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onTapFavorite(),
        splashRadius: 1,
        icon: Icon(
          Icons.favorite,
          size: 40,
          color: color,
        ));
  }
}
