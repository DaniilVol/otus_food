import 'package:flutter/material.dart';
import 'dart:async';

class TimerController {
  String timeString;
  StreamController<String> streamController = StreamController();
  Stream<String> get timer => streamController.stream;
  StreamSubscription<String>? subscription;

  TimerController({required this.timeString});

  void start() {
    int timeInSeconds = timeToSeconds(timeString);
    Stream<String> timerPeriodic =
        Stream.periodic(const Duration(seconds: 1), (i) => timeInSeconds - i)
            .map(secondsToTime)
            .take(timeInSeconds + 1);
    subscription =
        timerPeriodic.listen((event) => streamController.sink.add(event));
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
              isChecked = value!;
              widget.timerController.onChanged(isChecked);
              widget.allTimerController.onChanged(isChecked);
              setState(() {});
            }),
      ]),
      const SizedBox(
        height: 10,
      ),
      Row(children: [
        StreamBuilder(
            stream: widget.timerController.timer,
            initialData: widget.timeString,
            builder: ((context, snapshot) => Text(snapshot.requireData))),
      ]),
    ]);
  }
}
