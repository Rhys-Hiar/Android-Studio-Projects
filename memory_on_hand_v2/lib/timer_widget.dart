import 'package:flutter/material.dart';
import 'package:memory_on_hand_v2/notifications.dart';
import 'main.dart';

class TimerWidget extends StatefulWidget {
  final int duration;

  TimerWidget({required this.duration});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller)
      ..addListener(() {
        setState(() {});
        if (_animation.isCompleted) {
          //timer duration has reached 0, start notif
          createReminderNotifications();
        }
      });
    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(_animation.value * widget.duration).floor()}',
      style: TextStyle(fontSize: 64),
    );
  }
}
