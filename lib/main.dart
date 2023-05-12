import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer Application',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TimerPage(),
    );
  }
}
