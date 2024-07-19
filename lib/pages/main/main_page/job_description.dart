import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.fromLTRB(0, 33, 0, 27),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Positioned Image
              Container(
                margin: EdgeInsets.fromLTRB(22.8, 0, 30, 0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFAFECFE),
                          borderRadius: BorderRadius.circular(48),
                        ),
                        padding: EdgeInsets.all(14.7),
                        child: Image.asset(
                          'assets/images/google_1.png',
                          width: 54.6,
                          height: 54.6,
                        ),
                      ),
                    ),
                    Icon(Icons.more_vert, color: Colors.black),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 62),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F2F2),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(29, 20, 31.3, 21),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(2.3, 0, 0, 16),
                              child: Text(
                                'UI/UX Designer',
                                style: GoogleFonts.getFont(
                                  'DM Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xFF0D0140),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10.5, 0),
                                  child: SizedBox(
                                    width: 53,
                                    child: Text(
                                      'Google',
                                      style: GoogleFonts.getFont(
                                        'DM Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xFF0D0140),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 9, 0, 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0D0140),
                                      borderRadius: BorderRadius.circular(3.5),
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                    ),
                                  ),
                                ),
                                Text(
                                  'California',
                                  style: GoogleFonts.getFont(
                                    'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xFF0D0140),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 9, 0, 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0D0140),
                                      borderRadius: BorderRadius.circular(3.5),
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                    ),
                                  ),
                                ),
                                Text(
                                  '1 day ago',
                                  style: GoogleFonts.getFont(
                                    'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xFF0D0140),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Job Description',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF150B3D),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem ...',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF524B6B),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Opacity(
                          opacity: 0.2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF7551FF),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 7, 14.8, 7),
                            child: Text(
                              'Read more',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF0D0140),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 39),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Requirements',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF150B3D),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 10.6, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 11, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF524B6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Sed ut perspiciatis unde omnis iste natus error sit.',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF524B6B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 11, 21),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF524B6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF524B6B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 11, 23),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF524B6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF524B6B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 11, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF524B6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF524B6B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 0, 25, 47),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Conditions',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF150B3D),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 10.6, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 11, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF524B6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF524B6B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 11, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF524B6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF524B6B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF7551FF),
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: EdgeInsets.fromLTRB(26, 0, 25, 0),
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    ),
                    child: Text(
                      'Apply Now',
                      style: GoogleFonts.getFont(
                        'DM Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
