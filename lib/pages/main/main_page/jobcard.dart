import 'package:cjb/pages/main/create/add_job.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cjb/pages/main/main_page/Uploadcv.dart';
import 'package:cjb/pages/main/main_page/chat.dart';
import 'package:cjb/pages/main/main_page/job_description.dart';
import 'package:hive/hive.dart';

class JobCard extends StatelessWidget {
  final String jobId;
  final String jobTitle;
  final String company;
  final String location;
  final String employmentType;
  final String timestamp;
  final String description;
  final String posterId;
  final String email;

  JobCard({
    required this.jobId,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.employmentType,
    required this.timestamp,
    required this.description,
    required this.posterId, // Added posterId
    required this.email,
  });
// i want to add a checking logic in the bottommodal sheet ie i want the system to first compare the
// user id of the curent user and the poster id if  the ids are the same, more option are to be added ie (delete and edit)
// and also apply now option must not be shown meaning if the  if the current user id is simillar to the posterid only 4 options will be displayed ie (details,chat,delete, edit)
// if the current user id doesnot match the posterid the following options should be displayed(details, chat,applynow, save)
//keep the logic for details, chat and apply now the same. then for delete(make sure a job poster can delete the post they have made ie the post documen)
//then for edit(make sure the job poster can edit fields in the posted post document)
//for save  it should allow the current user to store the job details in a local storeage(hive) and displayed in another widget later
  void _openJobOptionsModalSheet(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      bool isJobPoster = currentUser.uid == posterId;

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
                if (!isJobPoster) ...[
                  _bottomNavigationItem(context,
                      title: "Apply now", iconData: Icons.send),
                  const SizedBox(height: 30),
                  _bottomNavigationItem(context,
                      title: "Save", iconData: Icons.bookmark),
                  const SizedBox(height: 30),
                ],
                _bottomNavigationItem(context,
                    title: "Chat", iconData: Icons.chat),
                const SizedBox(height: 30),
                if (isJobPoster) ...[
                  _bottomNavigationItem(context,
                      title: "Edit", iconData: Icons.edit),
                  const SizedBox(height: 30),
                  _bottomNavigationItem(context,
                      title: "Delete", iconData: Icons.delete),
                ],
              ],
            ),
          );
        },
      );
    }
  }

  Widget _bottomNavigationItem(BuildContext context,
      {required String title, required IconData iconData}) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(); // Close the bottom sheet
        if (title == "Details") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Description(
                jobTitle: jobTitle,
                company: company,
                location: location,
                employmentType: employmentType,
                timestamp: timestamp,
                description: description,
                email: email,
              ),
            ),
          );
        } else if (title == "Apply now") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CV_page(
                      email: email,
                    )),
          );
        } else if (title == "Chat") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                jobId: jobId,
                posterId: posterId,
                receiverId: posterId, // Receiver is the job poster
              ),
            ),
          );
        } else if (title == "Edit") {
          // Navigate to an edit screen or show an edit dialog
          // Implement edit functionality here
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => AddAjob(
          //       jobId: jobId,
          //       jobTitle: jobTitle,
          //       company: company,
          //       location: location,
          //       employmentType: employmentType,
          //       timestamp: timestamp,
          //       description: description,
          //       email: email,
          //     ),
          //   ),
          // );
        } else if (title == "Delete") {
          // Implement delete functionality here
          _deleteJobPost();
        } else if (title == "Save") {
          // Implement save functionality to local storage here
          void _saveJobPostToLocal() async {
            final currentUser = FirebaseAuth.instance.currentUser;

            if (currentUser != null) {
              await FirebaseFirestore.instance
                  .collection('saved_jobs')
                  .doc(currentUser.uid)
                  .collection('user_saved_jobs')
                  .doc(jobId)
                  .set({
                'jobId': jobId,
                'jobTitle': jobTitle,
                'company': company,
                'location': location,
                'employmentType': employmentType,
                'timestamp': timestamp,
                'description': description,
                'posterId': posterId,
                'email': email,
              });
            }
          }
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

  void _deleteJobPost() {
    FirebaseFirestore.instance.collection('jobs').doc(jobId).delete();
  }

  void _saveJobPostToLocal() async {
    var box = await Hive.openBox('savedJobs');
    box.put(jobId, {
      'jobTitle': jobTitle,
      'company': company,
      'location': location,
      'employmentType': employmentType,
      'timestamp': timestamp,
      'description': description,
      'email': email,
    });
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
                      jobTitle,
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
                        text: '# cjb',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          height: 1.3,
                          color: Colors.blue,
                        ),
                      ),
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
