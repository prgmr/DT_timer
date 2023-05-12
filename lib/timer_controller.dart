import 'dart:async';

import 'package:get/get.dart';

class Time {
  int minutes;
  int seconds;
  int milliseconds;

  Time(
      {required this.minutes,
      required this.seconds,
      required this.milliseconds});
}

class TimerController extends GetxController {
  var _msecElapsed = 0.obs;
  var isPaused = false.obs;
  RxList<Time> timeLaps = RxList<Time>();

  var _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {});

  Time get timeElapsed {
    int milliseconds = _msecElapsed.value;
    int seconds = milliseconds ~/ 1000;
    int minutes = seconds ~/ 60;
    seconds -= minutes * 60;
    milliseconds -= seconds * 1000 + minutes * 60 * 1000;

    return Time(minutes: minutes, seconds: seconds, milliseconds: milliseconds);
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void startTimer() {
    isPaused.value = false;
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (!isPaused.value) {
        _msecElapsed.value += 1;
      }
    });
  }

  void pauseTimer() {
    isPaused.value = true;
    _timer.cancel();
  }

  void resetTimer() {
    isPaused.value = true;
    _msecElapsed.value = 0;
  }

  void addTimeToLapsTimeList() {
    timeLaps.add(timeElapsed);
  }

  void clearLapsTimeList() {
    timeLaps.clear();
  }
}
