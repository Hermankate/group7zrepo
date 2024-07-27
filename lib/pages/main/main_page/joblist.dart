import 'package:cjb/pages/main/home/home_page.dart';
import 'package:cjb/pages/main/main_page/jobcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JobsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(child: Text('Job Listings')),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('jobs')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No job postings available.'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot job = snapshot.data!.docs[index];
                return JobCard(
                  timestamp: job['timestamp'].toDate().toString(),
                  jobTitle: job['title'],
                  company: job['company'],
                  location: job['location'],
                  employmentType: job['employmentType'],
                  // workType: job['workType'],
                  // convert timestamp to String
                  // salary: job['salary'],
                  description: job['description'],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
