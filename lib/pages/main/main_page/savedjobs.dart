import 'package:cjb/pages/main/main_page/jobcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SavedJobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return Center(child: Text('No user logged in'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Jobs'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('saved_jobs')
            .doc(currentUser.uid)
            .collection('user_saved_jobs')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No saved jobs found'));
          }

          final savedJobs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: savedJobs.length,
            itemBuilder: (context, index) {
              final job = savedJobs[index].data() as Map<String, dynamic>;

              return JobCard(
                jobId: job['jobId'],
                jobTitle: job['jobTitle'],
                company: job['company'],
                location: job['location'],
                employmentType: job['employmentType'],
                timestamp: job['timestamp'],
                description: job['description'],
                posterId: job['posterId'],
                email: job['email'],
              );
            },
          );
        },
      ),
    );
  }
}
