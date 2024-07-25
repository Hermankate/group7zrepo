// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:cjb/pages/auth/identity.dart';
import 'package:cjb/pages/main/home/home_page.dart';
import 'package:cjb/pages/main/user_profile/model/user.dart';
import 'package:cjb/pages/main/user_profile/prof.dart';
import 'package:cjb/pages/main/user_profile/utils/user_preferences.dart';
import 'package:cjb/pages/main/user_profile/widget/appbar_widget.dart';
import 'package:cjb/pages/main/user_profile/widget/button_widget.dart';
import 'package:cjb/pages/main/user_profile/widget/numbers_widget.dart';
import 'package:cjb/pages/main/user_profile/widget/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../auth/user_pref.dart';

// import 'package:user_profile_example/model/user.dart';
// import 'package:user_profile_example/utils/user_preferences.dart';
// import 'package:user_profile_example/widget/appbar_widget.dart';
// import 'package:user_profile_example/widget/button_widget.dart';
// import 'package:user_profile_example/widget/numbers_widget.dart';
// import 'package:user_profile_example/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    await GlobalVariables().loadUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath:
                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
            onClicked: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                  (route) => false);
            },
          ),
          const SizedBox(height: 24),
          buildName(user!),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            GlobalVariables().username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            GlobalVariables().email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Edit profile',
        onClicked: () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => Profile()), (route) => false);
        },
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'about',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
