import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';

class IngredientList {
  List<String> listName(index) {
    final List<String> name = myRecipes[index].ingNameRecipes;
    return name.map((e) => '\u2022 $e').toList();
  }

  List<String> listValue(index) {
    final List<String> value = myRecipes[index].ingValueRecipes;
    return value.map((e) => e).toList();
  }
}

class IngredientListWidget extends StatelessWidget {
  final int index;
  const IngredientListWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: IngredientList()
                  .listName(index)
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
              children: IngredientList()
                  .listValue(index)
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
      ),
    );
  }
}
