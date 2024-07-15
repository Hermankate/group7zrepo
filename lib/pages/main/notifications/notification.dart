// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'push_notification_service.dart';

class Notification_Page extends StatelessWidget {
  const Notification_Page({super.key});
  void initState() {
    super.initState();
    PushNotificationService().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text('Notifications will appear here')],
        ),
      ),
    );
  }
}
