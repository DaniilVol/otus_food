import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// class IngredientList {
//   final List<String> _name;
//   final List<String> _value;

//   List<String> get name => _name.map((e) => '\u2022 $e').toList();
//   List<String> get value => _value.map((e) => e).toList();

//   IngredientList(this._name, this._value);
// }

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
        .map((e) => Text('\u2022 $e',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500)))
        .toList();
    _valueText = _value
        .map((e) => Text(e,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400)))
        .toList();
  }

  void checkInredient() async {
    _nameText = [];
    _valueText = [];
    // List<String> refrigeratorName = [
    //   'Соевый соус',
    //   'Вода',
    //   'Мёд',
    //   'Коричневый сахар',
    //   'Чеснок',
    // ];
    var box = await Hive.openBox<List<String>>('ingredientRefrigerator');
    List<String> refrigeratorName =
        box.get('ingredientName', defaultValue: [])!;
    for (int i = 0; i < _name.length; i++) {
      if (!refrigeratorName.contains(_name[i])) {
        _nameText.add(Text('\u2022 ${_name[i]}',
            style: const TextStyle(
                color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500)));
        _valueText.add(Text(_value[i],
            style: const TextStyle(
                color: Colors.red, fontSize: 13, fontWeight: FontWeight.w400)));
        borderColor = Colors.red;
      } else {
        _nameText.add(Text('\u2022 ${_name[i]}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500)));
        _valueText.add(Text(_value[i],
            style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400)));
        borderColor = Colors.green;
      }
    }
    await box.close();
    notifyListeners();
  }
}
