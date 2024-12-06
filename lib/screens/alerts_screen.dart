import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AlertsScreen extends StatefulWidget {
  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  String? _notificationMessage;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.subscribeToTopic('weather_alerts');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _notificationMessage = message.notification?.body;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Alerts"),
      ),
      body: Center(
        child: Text(
          _notificationMessage ?? "No alerts yet.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
