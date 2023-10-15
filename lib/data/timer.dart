import 'package:flutter/material.dart';
import 'dart:async';

import 'package:otus_food/data/data_recipes.dart';

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
    // print(streamController.isClosed);
    //print(streamController.done);
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

  int timeToSeconds(timeString) {
    List timeList = timeString.split(':');
    int minutes = int.parse(timeList[0]);
    int seconds = int.parse(timeList[1]);
    return minutes * 60 + seconds;
  }
}

class TimerWidget extends StatefulWidget {
  final String timeString;
  final TimerController timerController;
  final TimerController allTimerController;

  const TimerWidget(
      {required this.timeString,
      required this.timerController,
      required this.allTimerController,
      super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  bool isChecked = false;

  @override
  void dispose() {
    widget.timerController.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Checkbox(
            value: isChecked,
            onChanged: (value) {
              if (widget.timerController.onDoneStreamController == false) {
                isChecked = value!;
                widget.timerController.onChanged(isChecked);
                widget.allTimerController.onChanged(isChecked);
                setState(() {});
              } else {
                isChecked = true;
              }
            }),
      ]),
      const SizedBox(
        height: 10,
      ),
      Row(children: [
        StreamBuilder(
            stream: widget.timerController.timer,
            initialData: widget.timeString,
            builder: ((context, snapshot) {
              if (widget.timerController.onDoneStreamController == true) {
                widget.allTimerController.onChanged(false);
              }
              return Text(snapshot.requireData);
            })),
      ]),
    ]);
  }
}

class AllTimeRecipes {
  TimerController allTimerController(OneRecipeIndex recipe) {
    return TimerController(timeString: secondsToTime(recipe));
  }
/* 
  List<String> listTime(index) {
    return OneRecipeIndex(index: index).stepTextRecipes;
  } */

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
