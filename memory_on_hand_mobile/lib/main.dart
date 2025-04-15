import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:ios_notification/home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  AwesomeNotifications().initialize('resource://drawable/play_store_512', [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      defaultColor: Colors.tealAccent,
      importance: NotificationImportance.High,
      enableLights: true,
      enableVibration: true,
      channelShowBadge: true,
    )
  ],);

runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
  routes: {
    '/home': (context) => Home()
  },
));
}