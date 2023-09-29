import 'package:flutter/material.dart';
import 'dart:async';

class TimerController {
  String timeString;
  int timeInSeconds1 = 71;

  Stream<String> get timer {
    int timeInSeconds = timeToSeconds(timeString);
    return Stream.periodic(const Duration(seconds: 1), (i) => timeInSeconds - i)
        .map((seconds) {
      int min = seconds ~/ 60;
      int sec = seconds - min * 60;
      return '${min < 10 ? '0$min' : min}:${sec < 10 ? '0$sec' : sec}';
    }).take(timeInSeconds + 1);
  }

  StreamController<String> streamController = StreamController();

  Stream<String> get controller => streamController.addStream(Stream<String> timer);

  TimerController({required this.timeString});

  int timeToSeconds(timeString) {
    List timeList = timeString.split(':');
    int minutes = int.parse(timeList[0]);
    int seconds = int.parse(timeList[1]);
    return minutes * 60 + seconds;
  }
  // ------

  // Stream<String> generatorStream() async* {
  //   int timeInSeconds = timeToSeconds(timeString);
  //   while (timeInSeconds >= 0) {
  //     int min = timeInSeconds ~/ 60;
  //     int sec = timeInSeconds - min * 60;
  //     yield '${min < 10 ? '0$min' : min}:${sec < 10 ? '0$sec' : sec}';
  //     Future.delayed(const Duration(seconds: 1));
  //     timeInSeconds--;
  //   }
  // }

  // Stream<String> streamTest =
  //     Stream.periodic(const Duration(seconds: 1), (i) => 71 - i).map((seconds) {
  //   int min = seconds ~/ 60;
  //   int sec = seconds - min * 60;
  //   return '${min < 10 ? '0$min' : min}:${sec < 10 ? '0$sec' : sec}';
  // }).take(71 + 1);

  // void streamtest() async {
  //   StreamController controller = StreamController();
  //   controller.sink
  //       .addStream(Stream.periodic(const Duration(seconds: 1), (i) => 71 - i));
  // }

  // StreamController controller = StreamController(); //.addStream(Stream.periodic(const Duration(seconds: 1), (i) => 71 - i));
  // // Stream<int> streamtest() => controller.stream  ;//addStream(Stream.periodic(const Duration(seconds: 1), (i) => 71 - i));
  // Stream timeController => timer.listen((event) => StreamController.add(event));
}

class TimerWidget extends StatelessWidget {
  final String timeString;
  final TimerController timerController;
  const TimerWidget(
      {required this.timeString, required this.timerController, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: timerController.timer,
        initialData: timeString,
        builder: ((context, snapshot) => Text(snapshot.requireData)));
  }
}
