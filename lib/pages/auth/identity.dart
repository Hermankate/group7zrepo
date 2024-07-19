// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cjb/components/my_button.dart';
import 'package:cjb/pages/auth/preferences.dart';
import 'package:flutter/material.dart';

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