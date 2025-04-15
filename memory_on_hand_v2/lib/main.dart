import 'package:flutter/material.dart';
import 'package:memory_on_hand_v2/Timer_Column.dart';
import 'settings.dart';
import 'timer_widget.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:memory_on_hand_v2/notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().cancelAll();
  runApp(MyApp());
}


Duration _timerDuration = Duration(seconds: 60);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // Define the TabController to switch between Timer and Settings tabs
  late TabController _tabController;
  AnimationController? _timerController;
  bool isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if(!isAllowed) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text('Allow notifications'),
          content: Text('Our app would like to send you notifications'),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child:Text(
              'Don\'t Allow',
              style: TextStyle(color: Colors.grey, fontSize: 18)
          )),
            TextButton(onPressed: () => AwesomeNotifications().requestPermissionToSendNotifications().then((_)=> Navigator.pop(context)),
                child: Text('Allow',
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )))
          ],
        ),);
      }
    });
    // Initialize the TabController with two tabs
    _tabController = TabController(length: 2, vsync: this);
    _timerController = AnimationController(vsync: this,
    duration: _timerDuration,);

  }

  @override
  void dispose() {
    _tabController.dispose();
    _timerController?.dispose();
    super.dispose();
  }
  void _startStopTimer() {
    if (_timerController == null) {
      _timerController = AnimationController(
        vsync: this,
      duration: _timerDuration,
      );
      _timerController!.forward();
    } else {
      _timerController!.stop();
      _timerController!.dispose();
      _timerController = null;
    }
    setState(() {
      isTimerRunning = _timerController != null && _timerController!.isAnimating;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.timer_rounded)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Create TimerWidgets for each timer
          MultiTimerTab(),
          // Add the SettingsTab widget to the TabBarView
          SettingsTab(),
        ],
    ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _startStopTimer();
            },
            child: Text(isTimerRunning ? 'Stop': 'Start'),
          ),
          SizedBox(width: 16),
        ],
      ),

    );
  }
}


