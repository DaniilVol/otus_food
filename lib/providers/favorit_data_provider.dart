import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// избранные рецепты, изменения списка, получение данных

class FavoriteData extends ChangeNotifier {
  late List<int> favoritesData;
  FavoriteData() {
    init();
  }

  void init() async {
    var box = await Hive.openBox<List<int>>('favoritesData');
    favoritesData = box.get(
          'favoritesList',
        ) ??
        [];
    await box.close();
    notifyListeners();
  }

  void add(int recipeIndex) async {
    var box = await Hive.openBox<List<int>>('favoritesData');
    favoritesData.add(recipeIndex);
    await box.clear();
    await box.put('favoritesList', favoritesData);
    await box.close();
    notifyListeners();
  }

  void remove(int recipeIndex) async {
    var box = await Hive.openBox<List<int>>('favoritesData');
    favoritesData.remove(recipeIndex);
    await box.clear();
    await box.put('favoritesList', favoritesData);
    box.close();
    notifyListeners();
  }
}
