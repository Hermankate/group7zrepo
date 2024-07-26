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

  void _openJobOptionsModalSheet(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 70,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[400]),
                ),
              ),
              const SizedBox(height: 40),
              _bottomNavigationItem(context,
                  title: "Details", iconData: Icons.info),
              const SizedBox(height: 30),
              _bottomNavigationItem(context,
                  title: "Apply now", iconData: Icons.send),
              const SizedBox(height: 30),
              _bottomNavigationItem(context,
                  title: "Save", iconData: Icons.bookmark_border),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomNavigationItem(BuildContext context,
      {required String title, required IconData iconData}) {
    return GestureDetector(
      onTap: () {
        // Handle tap event
        Navigator.of(context).pop(); // Close the bottom sheet
        // Add your specific actions for each item here
        if (title == "Details") {
          // Navigate to details page or show details
        } else if (title == "Apply now") {
          // Navigate to apply page or show apply form
        } else if (title == "Save") {
          // Save the job or add to saved jobs list
        }
      },
      child: Row(
        children: [
          Icon(iconData, color: Colors.black),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: const Color(0xFF232D3A),
            ),
          ),
        ],
      ),
    );
  }

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
                  backgroundImage: AssetImage('assets/holder.jpeg'),
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
                  onPressed: () {
                    _openJobOptionsModalSheet(context);
                  },
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
