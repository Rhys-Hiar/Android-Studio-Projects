import 'package:flutter/material.dart';
import 'settings.dart';
import 'timer_widget.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:memory_on_hand_v2/notifications.dart';

class MultiTimerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimerWidget(duration: 60),
      ],
    );
  }
}