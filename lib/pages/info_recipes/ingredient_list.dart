import 'package:flutter/material.dart';

class IngredientList {
  final List<String> _name;
  final List<String> _value;

  List<String> get name => _name.map((e) => '\u2022 $e').toList();
  List<String> get value => _value.map((e) => e).toList();

  IngredientList(this._name, this._value);
}

// class IngredientList {
//   final List<String> _name;
//   final List<String> _value;

//   List<Text> get name => _name.map((e) => Text('\u2022 $e', style: const TextStyle(
//   fontSize: 14, fontWeight: FontWeight.w500))).toList();
//   List<Text> get value => _value.map((e, style: const TextStyle(
//       fontSize: 13, fontWeight: FontWeight.w400),
// ) => Text(e)).toList();

//   IngredientList(this._name, this._value);
// }

class IngredientListWidget extends StatelessWidget {
  final List<String> listNameIngredient;
  final List<String> listValueIngredient;
  const IngredientListWidget({
    required this.listNameIngredient,
    required this.listValueIngredient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: IngredientList(listNameIngredient, listValueIngredient)
                .name
                .map((text) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ))
                .toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: IngredientList(listNameIngredient, listValueIngredient)
                .value
                .map((text) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
