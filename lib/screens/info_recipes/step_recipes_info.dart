import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/data/timer.dart';
import 'package:otus_food/models/step_data_model.dart';
import 'package:otus_food/widgets/step_recipes_widget.dart';

class StepRecipesInfo extends StatelessWidget {
  final OneRecipeIndex recipe;
  final TimerController allTimerController;
  final bool startCooking;
  const StepRecipesInfo(
      {required this.recipe,
      required this.allTimerController,
      super.key,
      required this.startCooking});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: ListStepData(
                  index: recipe
                      .index) // передаем индекс выбранного рецепта для создания списка виджетов шагов рецепта
              .listStepData
              .map((e) => StepWidget(
                    stepData: e,
                    allTimerController: allTimerController,
                    startCooking: startCooking,
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
