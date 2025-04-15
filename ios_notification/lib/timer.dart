import 'dart:async';
import 'package:flutter/material.dart';

class TimerData {
  int totalTime;
  int timeRemaining;
  TimerData(this.totalTime, this.timeRemaining);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _numTimers = 3;
  List<TimerData> _timerDataList = [];

  @override
  void initState() {
    super.initState();
    // Initialize timer data with default values
    for (int i = 0; i < _numTimers; i++) {
      _timerDataList.add(TimerData(60, 60));
    }
  }

  void _updateTotalTime(int index, int newTotalTime) {
    // Update the total time for a timer
    setState(() {
      _timerDataList[index].totalTime = newTotalTime;
      _timerDataList[index].timeRemaining = newTotalTime;
    });
  }

  Widget _buildTimerList() {
    // Build a list of Timer widgets
    List<Widget> timerWidgets = [];
    for (int i = 0; i < _numTimers; i++) {
      TimerData timerData = _timerDataList[i];
      timerWidgets.add(
        ListTile(
          title: Text('Timer ${i + 1}'),
          subtitle: Text('${timerData.timeRemaining} seconds remaining'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Show a dialog to edit the timer's total time
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Edit Timer ${i + 1}'),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Total Time (seconds)',
                      ),
                      onChanged: (value) {
                        _updateTotalTime(i, int.parse(value));
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
    }
    return Column(children: timerWidgets);
  }

  void _startTimers() {
    // Start all the timers at the same time
    setState(() {
      _timerDataList.forEach((timerData) {
        timerData.timeRemaining = timerData.totalTime;
        Timer.periodic(Duration(seconds: 1), (Timer timer) {
          setState(() {
            timerData.timeRemaining--;
            if (timerData.timeRemaining <= 0) {
              timer.cancel();
            }
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer App'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTimerList(),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Start Timers'),
                onPressed: _startTimers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
