import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification App'),
      ),
      body: NotificationList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the settings screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your actual list of notifications
    List<Widget> notifications = List.generate(
      5,
          (index) => NotificationItem(),
    );

    return ListView(
      children: notifications,
    );
  }
}

class NotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Notification Title'),
        subtitle: Text('Time left: 5 minutes'), // Replace with actual time left
        trailing: LinearProgressIndicator(value: 0.5), // Replace with actual progress
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings go here'),
      ),
    );
  }
}

