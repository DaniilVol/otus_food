import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/const/style.dart';

// список ингредиентов в рецепте

class IngredientListProvider extends ChangeNotifier {
  final List<String> _name;
  final List<String> _value;
  List<Text> _nameText = [];
  List<Text> _valueText = [];

  List<Text> get name => _nameText;
  List<Text> get value => _valueText;
  Color borderColor = Colors.grey;

  IngredientListProvider(this._name, this._value) {
    defaulInredient();
  }

  void defaulInredient() {
    _nameText = _name
        .map((e) => Text('\u2022 $e', style: Style.ingredientName.textStyle))
        .toList();
    _valueText = _value
        .map((e) => Text(e, style: Style.ingredientValue.textStyle))
        .toList();
  }

  // меняем состояние если ингредиентов нет в холодильнике

  void checkInredient() async {
    _nameText = [];
    _valueText = [];
    var box = await Hive.openBox<List<String>>('ingredientRefrigerator');
    List<String> refrigeratorName =
        box.get('ingredientName', defaultValue: [])!;
    for (int i = 0; i < _name.length; i++) {
      if (!refrigeratorName.contains(_name[i])) {
        _nameText.add(Text('\u2022 ${_name[i]}',
            style: Style.ingredientNameOff.textStyle));
        _valueText
            .add(Text(_value[i], style: Style.ingredientValueOff.textStyle));
        borderColor = Colors.red;
      } else {
        _nameText.add(
            Text('\u2022 ${_name[i]}', style: Style.ingredientName.textStyle));
        _valueText.add(Text(_value[i], style: Style.ingredientValue.textStyle));
        borderColor = Colors.green;
      }
    }
    await box.close();
    notifyListeners();
  }
}
