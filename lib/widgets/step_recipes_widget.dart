import 'package:flutter/material.dart';
import 'package:otus_food/data/timer.dart';
import 'package:otus_food/models/step_data_model.dart';

// виджет отрисовки одного шага приготовления

class StepWidget extends StatefulWidget {
  final TimerController allTimerController;
  final StepData stepData;
  const StepWidget(
      {required this.allTimerController, required this.stepData, super.key});

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  // bool isChecked = false;

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
            TimerWidget(
              timeString: widget.stepData.stepTime,
              timerController:
                  TimerController(timeString: widget.stepData.stepTime),
              allTimerController: widget.allTimerController,
            )
          ]),
        ));
  }
}
