import 'package:otus_food/data/data_recipes.dart';

class StepData {
  final int stepNum;
  final String stepText;
  final String stepTime;

  StepData(
      {required this.stepNum, required this.stepText, required this.stepTime});
}

class ListStepData {
  int index;

  List<StepData> get listStepData {
    List<StepData> list = [];
    for (int i = 0; i < myRecipes[index].stepTextRecipes.length; i++) {
      list.add(StepData(
          stepNum: i + 1,
          stepText: myRecipes[index].stepTextRecipes[i],
          stepTime: myRecipes[index].stepTimeRecipes[i]));
    }
    return list;
  }

  // в конструктор передаем индекс нажатого рецепта и берем его данные о шагах рецепта
  ListStepData({required this.index});
}
