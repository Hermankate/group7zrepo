import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(27, 26, 13, 21),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 76),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 61,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 2.1, 16.7, 2),
                                            width: 24,
                                            height: 24,
                                            child: SvgPicture.asset(
                                              'assets/vectors/union_1_x2.svg',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: SvgPicture.asset(
                                              'assets/vectors/icon_setting_1_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'California, USA',
                                      style: GoogleFonts.getFont(
                                        'DM Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 7),
                                      child: SizedBox(
                                        width: 179.9,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 9, 0),
                                              child: SizedBox(
                                                width: 80,
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '120k',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'DM Sans',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          height: 1.3,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: ' Follower',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'DM Sans',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '23k',
                                                    style: GoogleFonts.getFont(
                                                      'DM Sans',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' Following',
                                                    style: GoogleFonts.getFont(
                                                      'DM Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Positioned(
                                          top: -3,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Opacity(
                                              opacity: 0.1,
                                              child: SizedBox(
                                                width: 120,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/rectangle_1612_x2.svg',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 3, 10, 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 3.5, 10.8, 4.5),
                                                child: Text(
                                                  'Edit profile',
                                                  style: GoogleFonts.getFont(
                                                    'DM Sans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/edit_8_x2.svg',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildProfileListTile(
                      context,
                      'About me',
                      'assets/vectors/icon_29_x2.svg',
                      'assets/vectors/rectangle_16210_x2.svg',
                    ),
                    _buildProfileListTile(
                      context,
                      'Work experience',
                      'assets/vectors/icon_x2.svg',
                      'assets/vectors/rectangle_16240_x2.svg',
                    ),
                    _buildProfileListTile(
                      context,
                      'Education',
                      'assets/vectors/icon_28_x2.svg',
                      'assets/vectors/rectangle_16226_x2.svg',
                    ),
                    _buildProfileListTile(
                      context,
                      'Skills',
                      'assets/vectors/icon_19_x2.svg',
                      'assets/vectors/rectangle_1622_x2.svg',
                    ),
                    _buildProfileListTile(
                      context,
                      'Hobbies',
                      'assets/vectors/icon_22_x2.svg',
                      'assets/vectors/rectangle_1620_x2.svg',
                    ),
                    _buildProfileListTile(
                      context,
                      'Languages',
                      'assets/vectors/icon_24_x2.svg',
                      'assets/vectors/rectangle_1623_x2.svg',
                    ),
                    _buildProfileListTile(
                      context,
                      'Portfolio',
                      'assets/vectors/icon_30_x2.svg',
                      'assets/vectors/rectangle_1625_x2.svg',
                    ),
                    _buildProfileListTile(
                      context,
                      'References',
                      'assets/vectors/icon_33_x2.svg',
                      'assets/vectors/rectangle_1624_x2.svg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileListTile(BuildContext context, String title,
      String iconPath, String backgroundPath) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.getFont(
              'DM Sans',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xFF150B3D),
            ),
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {
          _showDialog(context, title);
        },
        child: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            'assets/vectors/add_x2.svg',
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add $title'),
          content: TextField(
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your text here',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Save the text or perform any action you want
                //print(_textEditingController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
