import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/data/timer.dart';
import 'package:otus_food/models/step_data_model.dart';
import 'package:otus_food/widgets/button_dark_green.dart';
import 'package:otus_food/widgets/step_recipes_widget.dart';

class StepRecipesInfo extends StatelessWidget {
  final OneRecipeIndex recipe;
  final TimerController allTimerController;
  const StepRecipesInfo(
      {required this.recipe, required this.allTimerController, super.key});

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
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 40,
        ),
        ButtonDarkGreen(onPressed: () {}, text: 'Начать готовить')
      ],
    );
  }
}
