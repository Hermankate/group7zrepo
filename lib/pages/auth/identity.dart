// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GlobalVariables {
  static final GlobalVariables _instance = GlobalVariables._internal();

  factory GlobalVariables() => _instance;

  GlobalVariables._internal();

  // Define all the fields to store user information
  String username = '';
  String email = '';
  String profileImageUrl = '';
  String aboutMe = '';
  String workExperience = '';
  String education = '';
  String skills = '';
  String hobbiesInterests = '';
  String portfolioUrl = '';
  String jobPreference = '';

  // Method to load user data from Firestore
  Future<void> loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        username = userDoc['name'] ?? '';
        email = userDoc['email'] ?? '';
        profileImageUrl = userDoc['image_path'] ?? '';
        aboutMe = userDoc['about_me'] ?? '';
        workExperience = userDoc['work_experience'] ?? '';
        education = userDoc['education'] ?? '';
        skills = userDoc['skills'] ?? '';
        hobbiesInterests = userDoc['hobbies_interests'] ?? '';
        portfolioUrl = userDoc['portfolio_url'] ?? '';
        jobPreference = userDoc['job_preference'] ?? '';
      }
    }
  }
}

class Identity_page extends StatelessWidget {
  final String firstName;
  const Identity_page({required this.firstName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Are you looking for a job?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 0,
                      activeColor: Color.fromRGBO(0, 96, 243, 1),
                      onChanged: null,
                    ),
                    Text(
                      "Yes, I'm looking for one",
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 0,
                      activeColor: Color.fromRGBO(0, 96, 243, 1),
                      onChanged: null,
                    ),
                    Text("Not really but I'd consider the right opportunity."),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Button(onTap: () {
                //   Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //           builder: (_) =>
                //               DropDownWidget(first_Name: firstName)),
                //       (route) => false);
                // })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// this is for navigating between pages!!
// Navigator.pushAndRemoveUntil(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (_) => const SignUpPage(),