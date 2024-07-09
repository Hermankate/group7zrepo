// ignore_for_file: prefer_const_constructors

import 'package:cjb/pages/main/jobs/jobs_page.dart';
import 'package:flutter/material.dart';
import 'package:cjb/theme/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:cjb/pages/onboarding/on_boarding_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * TOP AREA DRAWER - EXPANDED
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Image.asset("assets/profile_1.jpeg")),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Herman Stevens",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        child: const Text(
                          "View profile",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: cjbMediumGrey86888A),
                        ),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Profile_Page()),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: cjbLightGreyCACCCE,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Groups",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Events",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OnBoardingScreen()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Exit",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),

          // * BOTTOM AREA DRAWER
          Container(
            width: double.infinity,
            height: 1,
            color: cjbLightGreyCACCCE,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0, left: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 35,
                      color: cjbMediumGrey86888A,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: cjbMediumGrey86888A,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
