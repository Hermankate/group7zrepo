// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cjb/pages/main/notifications/push_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Notification_Page extends StatefulWidget {
  const Notification_Page({super.key});

  @override
  State<Notification_Page> createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {
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
