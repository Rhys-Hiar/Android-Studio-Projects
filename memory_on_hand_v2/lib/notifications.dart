import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

Future <void> createReminderNotifications() async{
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: 'Reminder!',
        body: 'Memory Retrival Time!',
        notificationLayout: NotificationLayout.Default,
      ) );
}