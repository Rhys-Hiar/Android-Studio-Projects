import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ios_notification/notifications.dart';

class Home extends StatefulWidget {
const Home({Key? key}) : super(key: key);

@override
_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App bar test text'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
        body:
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10 ),
          child: FloatingActionButton(
            onPressed: () {
              Timer(Duration(seconds: 0), createReminderNotifications);
              Timer(Duration(seconds: 5), createReminderNotifications);
              Timer(Duration(seconds: 11), createReminderNotifications);
              Timer(Duration(seconds: 26), createReminderNotifications);
              Timer(Duration(minutes: 1), createReminderNotifications);
              Timer(Duration(minutes: 2), createReminderNotifications);
              Timer(Duration(minutes: 5), createReminderNotifications);
              Timer(Duration(minutes: 10), createReminderNotifications);
              Timer(Duration(minutes: 20), createReminderNotifications);
              Timer(Duration(minutes: 35), createReminderNotifications);
              Timer(Duration(hours: 1), createReminderNotifications);
            },
            child: Text('press!',
              style: TextStyle(
                  color: Colors.black
              ),),
            backgroundColor: Colors.yellow,
          ),
        )
    );
  }}