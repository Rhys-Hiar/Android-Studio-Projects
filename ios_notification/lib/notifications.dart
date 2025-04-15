import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ios_notification/utilities.dart';

Future <void> createReminderNotifications() async{
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: 'Reminder!',
        body: 'Did you remember what you wanted to?',
        notificationLayout: NotificationLayout.Default,
      ) );
}