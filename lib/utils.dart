import 'timer_controller.dart';

String getFormattedTime(Time time) {
  StringBuffer sb = StringBuffer();
  sb.write("${time.minutes.toString().padLeft(2, '0')}:");
  sb.write("${time.seconds.toString().padLeft(2, '0')}:");
  sb.write(time.milliseconds.toString().padLeft(3, '0'));
  return sb.toString();
}
