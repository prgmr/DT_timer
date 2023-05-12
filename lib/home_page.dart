import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'timer_controller.dart';

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  final timerController = TimerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TimerApp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Obx(() => Text(
                    "${timerController.timeElapsed.minutes.toString().padLeft(2, '0')}:${timerController.timeElapsed.seconds.toString().padLeft(2, '0')}:${timerController.timeElapsed.milliseconds.toString().padLeft(3, '0')}",
                    style: const TextStyle(fontSize: 30))),
                const Text("min : sec : msec", style: TextStyle()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Obx(() => (!timerController.isPaused.value
                    ? ElevatedButton.icon(
                        onPressed: timerController.pauseTimer,
                        icon: const Icon(Icons.pause),
                        label: const Text("Pause"))
                    : ElevatedButton.icon(
                        onPressed: timerController.startTimer,
                        icon: const Icon(Icons.play_arrow),
                        label: const Text("Start")))),
                ElevatedButton.icon(
                    onPressed: timerController.resetTimer,
                    icon: const Icon(Icons.restart_alt),
                    label: const Text("Reset")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
