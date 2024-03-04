import 'package:flutter/material.dart';
import 'package:otus_food/const/color_list.dart';
import 'dart:async';
import 'package:otus_food/data/data_recipes.dart';

// таймер

class TimerController {
  String timeString;
  StreamController<String> streamController = StreamController();
  Stream<String> get timer => streamController.stream;
  StreamSubscription<String>? subscription;
  bool onDoneStreamController = false;

  TimerController({required this.timeString});

  void start() {
    int timeInSeconds = timeToSeconds(timeString);
    Stream<String> timerPeriodic =
        Stream.periodic(const Duration(seconds: 1), (i) => timeInSeconds - i)
            .map(secondsToTime)
            .take(timeInSeconds + 1);
    subscription = timerPeriodic.take(timeInSeconds + 1).listen(
          (event) => streamController.sink.add(event),
          onDone: () => onDoneStreamController = true,
        );
  }

  void pause() {
    subscription?.pause();
  }

  void cancel() {
    subscription?.cancel();
  }

  void resume() {
    subscription?.resume();
  }

  void onChanged(bool isChecked) {
    isChecked
        ? subscription?.isPaused == null || false
            ? start()
            : resume()
        : pause();
  }

  String secondsToTime(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds - min * 60;
    return '${min < 10 ? '0$min' : min}:${sec < 10 ? '0$sec' : sec}';
  }

  int timeToSeconds(String timeString) {
    List timeList = timeString.split(':');
    int minutes = int.parse(timeList[0]);
    int seconds = int.parse(timeList[1]);
    return minutes * 60 + seconds;
  }
}

// виджет таймера в списке шагов приготавления

class TimerWidget extends StatefulWidget {
  final String timeString;
  final TimerController timerController;
  final TimerController allTimerController;
  final bool startCooking;

  const TimerWidget(
      {required this.timeString,
      required this.timerController,
      required this.allTimerController,
      super.key,
      required this.startCooking});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = false;

    super.initState();
  }

  @override
  void dispose() {
    widget.timerController.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Checkbox(
          activeColor: ColorList.cookingCheckBox.color,
          checkColor: ColorList.white.color,
          side: BorderSide(
            width: 2,
            color: ColorList.cookingCheckBox.color,
          ),
          value: widget.startCooking ? isChecked : false || (isChecked = false),
          onChanged: (value) {
            // если нажата кнопка начать готовить
            if (widget.startCooking) {
              // если таймер включен или чекбокс включен, нельзя включить несколько одновременно
              if (widget.allTimerController.subscription?.isPaused != false ||
                  value == false) {
                // если таймер активен то управляем им
                if (widget.timerController.onDoneStreamController == false) {
                  isChecked = value!;
                  widget.timerController.onChanged(isChecked);
                  widget.allTimerController.onChanged(isChecked);
                  setState(() {});
                } else {
                  isChecked = true;
                }
              }
            } else {
              widget.timerController.cancel();
            }
          }),
      const SizedBox(
        height: 10,
      ),
      widget.startCooking
          ? StreamBuilder(
              stream: widget.timerController.timer,
              initialData: widget.timeString,
              builder: ((context, snapshot) {
                if (widget.timerController.onDoneStreamController == true) {
                  widget.allTimerController.onChanged(false);
                }
                return Text(snapshot.requireData,
                    style: TextStyle(color: ColorList.cookingCheckBox.color));
              }))
          : Text(widget.timeString,
              style: TextStyle(
                color: ColorList.black.color,
              )),
    ]);
  }
}

// общее время всех шагов приготавления рецепта

class AllTimeRecipes {
  TimerController allTimerController(OneRecipeIndex recipe) {
    return TimerController(timeString: secondsToTime(recipe));
  }

  String secondsToTime(OneRecipeIndex recipe) {
    int seconds = timeToSeconds(recipe);
    int min = seconds ~/ 60;
    int sec = seconds - min * 60;
    return '${min < 10 ? '0$min' : min}:${sec < 10 ? '0$sec' : sec}';
  }

  int timeToSeconds(OneRecipeIndex recipe) {
    int initialValue = 0;
    int seconds = 0;
    int allSeconds = recipe.stepTimeRecipes.fold<int>(initialValue,
        (previousValue, element) {
      List timeList = element.split(':');
      seconds = seconds + int.parse(timeList[0]) * 60 + int.parse(timeList[1]);
      return seconds;
    });
    return allSeconds;
  }
}
