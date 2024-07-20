import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _gender = 'Male'; // Default value for gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 42, 20, 91),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(2.8, 0, 2.8, 50.5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF524B6B),
                        ),
                        child: Container(
                          width: 18.2,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Settings',
                      style: GoogleFonts.getFont(
                        'DM Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF150A33),
                      ),
                    ),
                  ),
                ),
                _buildSettingOption(
                  iconPath: 'assets/vectors/rectangle_596_x2.svg',
                  title: 'Notifications',
                  trailingIcon: 'assets/vectors/group_441_x2.svg',
                ),
                _buildSettingOption(
                  iconPath: 'assets/vectors/rectangle_59104_x2.svg',
                  title: 'Dark mode',
                  trailingIcon: 'assets/vectors/group_43_x2.svg',
                ),
                _buildSettingOption(
                  iconPath: 'assets/vectors/rectangle_5979_x2.svg',
                  title: 'Password',
                  trailingIcon: 'assets/vectors/icon_7_x2.svg',
                ),
                _buildSettingOption(
                  iconPath: 'assets/vectors/rectangle_598_x2.svg',
                  title: 'Logout',
                  trailingIcon: 'assets/vectors/icon_33_x2.svg',
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF130160),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x2E99ABC6),
                          offset: Offset(0, 4),
                          blurRadius: 31,
                        ),
                      ],
                    ),
                    child: Container(
                      width: 213,
                      padding: EdgeInsets.fromLTRB(6.7, 16, 0, 16),
                      child: Text(
                        'SAVE',
                        style: GoogleFonts.getFont(
                          'DM Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 0.8,
                          color: Color(0xFFFFFFFF),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required String iconPath,
    required String title,
    required String trailingIcon,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Stack(
        children: [
          Positioned(
            left: -20,
            right: -20,
            top: -13,
            bottom: -13,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 335,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x2E99ABC6),
                      offset: Offset(0, 4),
                      blurRadius: 31,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  iconPath,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 335,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 13, 23, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 11, 0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            'assets/vectors/icon_7_x2.svg',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: Text(
                          title,
                          style: GoogleFonts.getFont(
                            'DM Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF150B3D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                    child: SizedBox(
                      width: 38,
                      height: 19,
                      child: SvgPicture.asset(
                        trailingIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
