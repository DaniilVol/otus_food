import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/data_recipes.dart';

class IngredientRefrigerator extends ChangeNotifier {
  List<String> ingredientName = [];
  List<String> ingredientValue = [];
  List<Text> get name => ingredientName
      .map((e) => Text('\u2022 $e',
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)))
      .toList();
  List<Text> get value => ingredientValue
      .map((e) => Text(e,
          style: const TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400)))
      .toList();

  List<int> listRecomendedRecipesIndex = [];
  IngredientRefrigerator() {
    _init();
  }

  Future<void> _init() async {
    var box = await Hive.openBox<List<String>>('ingredientRefrigerator');

    // await box.put('ingredientName', [
    //   'Соевый соус',
    //   'Вода',
    //   'Мёд',
    //   'Коричневый сахар',
    //   'Чеснок',
    // ]);

    // await box.put('ingredientValue', [
    //   '8 ст. ложек',
    //   '8 ст. ложек',
    //   '3 ст. ложки',
    //   '2 ст. ложки',
    // ]);

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

  void checkIngredient(List<String> ingredient) {
    for (int i = 0; i < ingredient.length; i++) {
      if (!ingredientName.contains(ingredient[i])) {
        //containsAll = false;
        break;
      }
    }
  }
}
