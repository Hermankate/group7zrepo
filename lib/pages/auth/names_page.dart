import 'package:cjb/components/my_button.dart';
import 'package:cjb/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:cjb/pages/auth/identity.dart';

class Names_page extends StatelessWidget {
  const Names_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                Image(
                  image: AssetImage("assets/logo.jpg"),
                ),
                Text(
                  'Fill in your details',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 96, 243, 1.0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Text(
                        'First name',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                MytextApp(),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Text(
                        'Last name',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                MytextApp(),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 20,
                ),
                Button(onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const Identity_page()),
                      (route) => false);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
