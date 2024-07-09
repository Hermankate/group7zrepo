import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cjb/pages/main/create/create_page.dart';
import 'package:cjb/pages/main/home/home_page.dart';
import 'package:cjb/pages/main/jobs/jobs_page.dart';
import 'package:cjb/pages/main/main_page/widgets/drawer_widget.dart';
import 'package:cjb/pages/main/network/network_page.dart';
import 'package:cjb/pages/main/notifications/notifications_page.dart';
import 'package:cjb/theme/styles.dart';

import 'widgets/app_bar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
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
              icon: Icon(FontAwesomeIcons.userGroup),
              label: "Follow",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.briefcase),
              label: "Jobs",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 30,
              ),
              label: "Post",
            ),
          ],
        ),
        body: _switchPages(_currentPageIndex));
  }

  _switchPages(int index) {
    switch (index) {
      case 0:
        {
          return const HomePage();
        }
      case 1:
        {
          //return const NetworkPage();
        }
      case 4:
        {
          return const JobsPage();
        }
      case 3:
        {
          return const NotificationsPage();
        }
      case 2:
        {
          return CreatePage(
            onCloneClickListener: () {
              Navigator.pop(context);
              setState(() {
                _currentPageIndex = 0;
              });
            },
          );
        }
    }
  }
}
