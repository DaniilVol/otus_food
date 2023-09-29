import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/data/timer.dart';

// класс для создания шага
class StepData {
  final int stepNum;
  final String stepText;
  final String stepTime;

  StepData(
      {required this.stepNum, required this.stepText, required this.stepTime});
}

// виджет отрисовки одного шага приготовления

class StepWidget extends StatefulWidget {
  final StepData stepData;
  const StepWidget({required this.stepData, super.key});

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  @override
  Widget build(Object context) {
    return Card(
        color: const Color(0xffececec),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              Text(
                '${widget.stepData.stepNum}',
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffc2c2c2)),
              )
            ]),
            Flexible(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(widget.stepData.stepText,
                      style: const TextStyle(color: Colors.black)),
                )
              ]),
            ),
            Column(
              children: [
                Row(children: [
                  Checkbox(value: false, onChanged: (_) {}),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TimerWidget(
                        timeString: widget.stepData.stepTime,
                        timerController: TimerController(
                            timeString: widget.stepData.stepTime))
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}

// список шагов

class ListStepData {
  int index;

  List<StepData> get listStepData {
    List<StepData> list = [];
    // проверяем колличество текстовых полей и полей времени
    if (myRecipes[index].stepTextRecipes.length ==
        myRecipes[index].stepTimeRecipes.length) {
      for (int i = 0; i < myRecipes[index].stepTextRecipes.length; i++) {
        list.add(StepData(
            stepNum: i + 1,
            stepText: myRecipes[index].stepTextRecipes[i],
            stepTime: myRecipes[index].stepTimeRecipes[i]));
      }
    } else {
      throw Exception('Колличество шагов текста и времени не совпадает');
    }
    return list;
  }

  // в конструктор передаем индекс нажатого рецепта и берем его данные о шагах рецепта
  ListStepData({required this.index});
}
