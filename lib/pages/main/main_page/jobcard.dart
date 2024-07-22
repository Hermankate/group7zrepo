import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String employmentType;
  //final String workType;
  final String timestamp;
  //final String salary;
  final String description;

  JobCard({
    required this.title,
    required this.company,
    required this.location,
    required this.employmentType,
    //required this.workType,
    required this.timestamp,
    //required this.salary,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'url_to_image'), // Replace with actual image URL
                  radius: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      title,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xFF232D3A),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              '$company - $location',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF524B6B),
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF524B6B),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag(employmentType),
                // _buildTag(workType),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timestamp,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color(0xFFAAA6B9),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF232D3A),
                    ),
                    children: [
                      TextSpan(
                        text:
                            'ugx:300k', //salary.isNotEmpty ? 'UGx: $salary' : '',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                      // if (salary.isNotEmpty)
                      //   TextSpan(
                      //     text: '/',
                      //     style: GoogleFonts.dmSans(
                      //       fontWeight: FontWeight.w700,
                      //       fontSize: 12,
                      //       height: 1.3,
                      //       color: Color(0xFFAAA6B9),
                      //     ),
                      //   ),
                      // if (salary.isNotEmpty)
                      //   TextSpan(
                      //     text: 'Mo',
                      //     style: GoogleFonts.dmSans(
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: 12,
                      //       height: 1.3,
                      //       color: Color(0xFFAAA6B9),
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFCBC9D4),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Color(0xFF524B6B),
            ),
          ),
        ),
      ),
    );
  }
}
