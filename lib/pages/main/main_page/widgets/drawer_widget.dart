import 'package:cjb/pages/auth/identity.dart';
import 'package:cjb/pages/main/user_profile/prof.dart';
import 'package:cjb/pages/main/user_profile/profile_page.dart';
import 'package:cjb/res/settings.dart';
import 'package:flutter/cupertino.dart';
// import 'package:cjb/pages/main/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:cjb/theme/styles.dart';
import 'package:cjb/pages/onboarding/on_boarding_screen.dart';

class DrawerWidget extends StatefulWidget {
  final String firstName;

  const DrawerWidget({required this.firstName, Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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
    return Drawer(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * TOP AREA DRAWER - EXPANDED
          Expanded(
            child: SingleChildScrollView(
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
                              child: Image.asset("assets/holder.jpeg")),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${GlobalVariables().username}",
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
                                MaterialPageRoute(builder: (_) => Profile()),
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
                      "upload cv",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "applications",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                        "Log Out",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // * BOTTOM AREA DRAWER
          Container(
            width: double.infinity,
            height: 1,
            color: cjbLightGreyCACCCE,
          ),
          Padding(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => Settings()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            color: cjbMediumGrey86888A,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
