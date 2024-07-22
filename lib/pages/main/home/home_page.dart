// // import 'package:flutter/material.dart';
// // import 'package:cjb/data/post_entity.dart';
// // import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
// // import 'package:cjb/theme/styles.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final ScrollController _controller = ScrollController();

// //   bool _isShow = true;

// //   List<PostEntity> postData = PostEntity.postListData;

// //   @override
// //   void initState() {
// //     _controller.addListener(() {
// //       if (_controller.position.pixels > 3) {
// //         setState(() {
// //           _isShow = false;
// //         });
// //       } else {
// //         setState(() {
// //           _isShow = true;
// //         });
// //       }
// //     });
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Column(
// //       children: [
// //         const SizedBox(
// //           height: 5,
// //         ),
// //         _isShow
// //             ? Container(
// //                 width: double.infinity,
// //                 height: 8,
// //                 color: cjbLightGreyCACCCE,
// //               )
// //             : Container(),
// //         Expanded(
// //           child: ListView.builder(
// //             controller: _controller,
// //             itemCount: postData.length,
// //             itemBuilder: (context, index) {
// //               final post = postData[index];
// //               return SinglePostCardWidget(post: post);
// //             },
// //           ),
// //         ),
// //       ],
// //     ));
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cjb/data/post_entity.dart';
// import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
// import 'package:cjb/theme/styles.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _controller = ScrollController();
//   bool _isShow = true;
//   List<PostEntity> postData = PostEntity.postListData;

//   @override
//   void initState() {
//     _controller.addListener(() {
//       if (_controller.position.pixels > 3) {
//         setState(() {
//           _isShow = false;
//         });
//       } else {
//         setState(() {
//           _isShow = true;
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(height: 5),
//           _isShow
//               ? Container(
//                   width: double.infinity,
//                   height: 8,
//                   color: cjbLightGreyCACCCE,
//                 )
//               : Container(),
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 List<PostEntity> posts = snapshot.data!.docs
//                     .map((doc) => PostEntity.fromFirestore(doc))
//                     .toList();

//                 return ListView.builder(
//                   controller: _controller,
//                   itemCount: posts.length,
//                   itemBuilder: (context, index) {
//                     final post = posts[index];
//                     return SinglePostCardWidget(post: post);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cjb/data/post_entity.dart';
import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'single_post_card_widget.dart'; // Adjust the import based on your file structure
//import 'post_entity.dart'; // Adjust the import based on your file structure
import 'package:cjb/theme/styles.dart'; // Adjust the import based on your file structure

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  bool _isShow = true;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels > 3) {
        setState(() {
          _isShow = false;
        });
      } else {
        setState(() {
          _isShow = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 5),
          _isShow
              ? Container(
                  width: double.infinity,
                  height: 8,
                  color: cjbLightGreyCACCCE,
                )
              : Container(),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                }

                List<PostEntity> posts = snapshot.data!.docs
                    .map((doc) => PostEntity.fromFirestore(doc))
                    .toList();

                // Debugging data
                for (var post in posts) {
                  print('Post Images: ${post.postImages}');
                  print('Post Image: ${post.postImage}');
                }

                return ListView.builder(
                  controller: _controller,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return SinglePostCardWidget(post: post);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
