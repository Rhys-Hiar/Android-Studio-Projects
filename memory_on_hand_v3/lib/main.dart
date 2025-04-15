import 'package:flutter/material.dart';
import 'dart:async';
import 'button_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  void resetTimer() => setState(() => seconds = maxSeconds);

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0 ) {
        setState(() => seconds--);
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() => timer?.cancel());
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTimer(),
            const SizedBox(height: 80),
            buildButtons(),
          ],
        )
      )
    )
  );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds ==maxSeconds || seconds == 0;

    return isRunning || !isCompleted
      ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
            text: isRunning ? 'Pause': 'Resume',
            onClicked: () {
              if (isRunning) {
                stopTimer(reset: false);
              }
              else {
                startTimer(reset: false);
              }
        }),
        const SizedBox(width: 12),
        ButtonWidget(
            text: 'Cancel/Reset',
            onClicked: stopTimer),
      ],
    )

    : ButtonWidget(
      text: 'Start Timer!',
      color: Colors.white,
      backgroundColor: Colors.black,
      onClicked: () {
        startTimer();
    },
    );
  }

  Widget buildTimer() => SizedBox(
    width: 200,
      height: 200,
    child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - seconds / maxSeconds,
            valueColor: AlwaysStoppedAnimation(Colors.white),
            strokeWidth: 12,
            backgroundColor: Colors.greenAccent,
          ),
          Center(child: buildTime()),
        ]
    )
  );

  Widget buildTime() {
    return Text(
      '$seconds',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 80,
      )
    );
  }
}