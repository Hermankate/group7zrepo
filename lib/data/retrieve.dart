// import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cjb/theme/styles.dart';
// import 'package:cjb/data/post_entity.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('posts')
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           final posts = snapshot.data!.docs.map((doc) {
//             return PostEntity(
//               // imageUrl: doc['image_url'],
//               description: doc['description'],
//               username: 'Username', // Add username field in your data model
//               userProfile:
//                   'user_profile_image', // Add user profile image field in your data model
//               userBio: 'User bio', // Add user bio field in your data model
//               createAt: 'Timestamp', // Add timestamp field in your data model
//               tags: ['tag1', 'tag2'], // Add tags field in your data model
//               postImages: [
//                 doc['image_url']
//               ], // Add multiple images field in your data model
//               totalReacts: 0, // Add total reacts field in your data model
//               totalComments: 0, // Add total comments field in your data model
//               totalReposts: 0, // Add total reposts field in your data model
//             );
//           }).toList();

//           return ListView.builder(
//             itemCount: posts.length,
//             itemBuilder: (context, index) {
//               return SinglePostCardWidget(post: posts[index]);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
