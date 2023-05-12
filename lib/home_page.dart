import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'timer_controller.dart';
import 'utils.dart';

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  final timerController = TimerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Timer"),
        ),
        body: Container(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: timerController.addTimeToLapsTimeList,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.8),
                          Theme.of(context).primaryColorLight.withOpacity(0.8),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          blurRadius: 10.0,
                          offset: const Offset(5.0, 10.0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                              getFormattedTime(timerController.timeElapsed),
                              style: Theme.of(context).textTheme.displaySmall),
                        ),
                        const Text("min : sec : msec",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black54)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Obx(() => timerController.isPaused.value
                        ? ElevatedButton.icon(
                            onPressed: timerController.pauseTimer,
                            icon: const Icon(Icons.pause),
                            label: const Text("Pause"))
                        : ElevatedButton.icon(
                            onPressed: timerController.startTimer,
                            icon: const Icon(Icons.play_arrow),
                            label: const Text("Start"))),
                    ElevatedButton.icon(
                        onPressed: timerController.resetTimer,
                        icon: const Icon(Icons.restart_alt),
                        label: const Text("Reset")),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Scrollbar(
                  child: Obx(
                    () => ListView.builder(
                      reverse: true,
                      itemCount: timerController.timeLaps.length,
                      itemBuilder: (context, index) {
                        final timer = timerController.timeLaps[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(getFormattedTime(timer),
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Text(
                                '${index + 1} Lap',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
