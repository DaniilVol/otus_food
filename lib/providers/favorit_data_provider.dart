import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteData extends ChangeNotifier {
  List<int> favoritesData = [];
  FavoriteData() {
    init();
  }

  void init() async {
    var box = await Hive.openBox<List<int>>('favoritesData');
    favoritesData = box.get('favoritesList', defaultValue: [])!;
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
