import 'package:flutter/material.dart';
import 'package:otus_food/models/ingredient_list_model.dart';

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
  final List<Text> listNameIngredient;
  final List<Text> listValueIngredient;
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
            children: listNameIngredient
                .map((text) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: text
                    /* Text(
                        text,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ), */
                    ))
                .toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: listValueIngredient
                .map((text) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: text
                    /* Text(
                        text,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ), */
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
