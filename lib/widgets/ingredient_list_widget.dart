import 'package:flutter/material.dart';

// виджет список ингредиентов

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
                .map(
                  (text) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: text),
                )
                .toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: listValueIngredient
                .map(
                  (text) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: text),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
