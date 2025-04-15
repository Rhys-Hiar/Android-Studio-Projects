import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'timer_widget.dart';
import 'Timer_Column.dart';
import 'main.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  int _timerDuration = 60;

  void _onDurationChanged(String value) {
    setState(() {
      _timerDuration = int.tryParse(value) ?? _timerDuration;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Timer Duration:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Timer Duration (seconds)',
            ),
            onChanged: (value) {
              setState(() {
                _timerDuration = Duration(seconds: int.parse(value)) as int;
              });
            },
          ),
        ],
      ),
    );
  }
}



