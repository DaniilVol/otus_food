import 'package:flutter/material.dart';
import 'package:otus_food/const/color_list.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/models/ingredient_list_model.dart';
import 'package:otus_food/widgets/ingredient_list_widget.dart';
import 'package:provider/provider.dart';

// экран ингредиентов в информации о рецепте

class IngredientsRecipeInfo extends StatelessWidget {
  final OneRecipeIndex recipe;
  const IngredientsRecipeInfo({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: context.watch<IngredientListProvider>().borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: IngredientListWidget(
                listNameIngredient:
                    context.watch<IngredientListProvider>().name,
                listValueIngredient:
                    context.watch<IngredientListProvider>().value,
              ),
            )),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () =>
              context.read<IngredientListProvider>().checkInredient(),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(color: ColorList.darkGreen.color, width: 2),
                  borderRadius: BorderRadius.circular(30))),
              minimumSize: MaterialStateProperty.all(const Size(300, 50)),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 255, 255, 255)),
              elevation: MaterialStateProperty.all(0),
              splashFactory: NoSplash.splashFactory),
          child: Text(
            'Проверить наличие',
            style: TextStyle(
                color: ColorList.darkGreen.color,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
