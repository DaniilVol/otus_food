import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/const/style.dart';
import 'package:otus_food/data/data_recipes.dart';

// ингредиенты в холодильнике

class IngredientRefrigerator extends ChangeNotifier {
  List<String> ingredientName = [];
  List<String> ingredientValue = [];
  List<Text> get name => ingredientName
      .map((e) => Text('\u2022 $e', style: Style.ingredientName.textStyle))
      .toList();
  List<Text> get value => ingredientValue
      .map((e) => Text(e, style: Style.ingredientValue.textStyle))
      .toList();

  List<int> listRecomendedRecipesIndex = [];
  IngredientRefrigerator() {
    _init();
  }

  Future<void> _init() async {
    var box = await Hive.openBox<List<String>>('ingredientRefrigerator');

    ingredientName = box.get('ingredientName', defaultValue: [])!;
    ingredientValue = box.get('ingredientValue', defaultValue: [])!;
    await box.close();
    notifyListeners();
  }

  void findRecipes() {
    listRecomendedRecipesIndex.clear();

    for (int i = 0; i < myRecipes.length; i++) {
      List<String> ingredients = myRecipes[i].ingredientName;

      bool containsAll = true;
      for (int j = 0; j < ingredients.length; j++) {
        if (!ingredientName.contains(ingredients[j])) {
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
