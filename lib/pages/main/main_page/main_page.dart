import 'package:cjb/pages/main/notifications/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cjb/pages/main/create/create_page.dart';
import 'package:cjb/pages/main/home/home_page.dart';
//import 'package:cjb/pages/main/user_profile/user_profile.dart';
import 'package:cjb/pages/main/main_page/widgets/drawer_widget.dart';
import 'package:cjb/theme/styles.dart';

import 'widgets/app_bar_widget.dart';

class MainPage extends StatefulWidget {
  final String firstName;
  const MainPage(
      {required this.firstName, super.key, required String first_Name});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(
          firstName: widget.firstName,
        ),
        key: _scaffoldState,
        appBar: _currentPageIndex == 4
            ? appBarWidget(context, title: "Search Jobs", isJobsTab: true,
                onLeadingTapClickListener: () {
                setState(() {
                  _scaffoldState.currentState!.openDrawer();
                });
              })
            : appBarWidget(context, title: "Search", isJobsTab: false,
                onLeadingTapClickListener: () {
                setState(() {
                  _scaffoldState.currentState!.openDrawer();
                });
              }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedItemColor: cjbBlack000000,
          selectedLabelStyle: const TextStyle(color: cjbBlack000000),
          unselectedItemColor: cjbMediumGrey86888A,
          unselectedLabelStyle: const TextStyle(color: cjbMediumGrey86888A),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: "Notifications",
            ),
          ],
        ),
        body: _switchPages(_currentPageIndex));
  }

  _switchPages(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return CreatePage(
          onCloneClickListener: () {
            Navigator.pop(context);
            setState(() {
              _currentPageIndex = 0;
            });
          },
        );
      case 2:
        return const Notification_Page();
      default:
        return const HomePage(); // Fallback to HomePage or a default page
    }
  }
}
