import 'package:flutter/material.dart';
import 'dart:async';

class TimerRecipesWidget extends StatefulWidget {
  final Duration startTimerStep;
  const TimerRecipesWidget({required this.startTimerStep, super.key});

  @override
  State<TimerRecipesWidget> createState() => _TimerRecipesWidgetState();
}

class _TimerRecipesWidgetState extends State<TimerRecipesWidget> {
  Timer? countDownTimer;
  Duration? start;
  final Duration interval = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    countDownTimer = Timer.periodic(interval, (timer) => countDown);
  }

  void countDown() {
    setState(() {
      final seconds = widget.startTimerStep.inSeconds - 1;
      if (seconds < 0) {
        countDownTimer!.cancel();
      } else {
        start = Duration(seconds: seconds);
      }
    });
    // final timer = Timer.periodic(widget.startTimerStep, () {});
  }

  @override
  Widget build(BuildContext context) {
    //int minute = start.inMinutes;
    //int second = start.inSeconds;
    return Row(
      children: [
        // Text('$minute : $second'),
        TextButton(onPressed: startTimer, child: const Text('data')),
      ],
    );
  }
}
