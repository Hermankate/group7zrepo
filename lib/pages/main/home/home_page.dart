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
import 'package:cjb/pages/main/create/posts/post_service.dart';
import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cjb/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cjb/data/post_entity.dart';
import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
import 'package:cjb/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:cjb/data/post_entity.dart';
import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
import 'package:cjb/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:cjb/data/post_entity.dart';
import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
import 'package:cjb/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:cjb/data/post_entity.dart';
import 'package:cjb/pages/main/home/widgets/single_post_card_widget.dart';
import 'package:cjb/theme/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  bool _isShow = true;
  late Future<List<PostEntity>> _postsFuture;
  final PostService _postService = PostService();

  @override
  void initState() {
    super.initState();
    _postsFuture = _postService.fetchPosts();

    _controller.addListener(() {
      // Using a variable to track if _isShow is already in the desired state
      if (_controller.position.pixels > 3 && _isShow) {
        setState(() {
          _isShow = false;
        });
      } else if (_controller.position.pixels <= 3 && !_isShow) {
        setState(() {
          _isShow = true;
        });
      }
    });
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
            child: FutureBuilder<List<PostEntity>>(
              future: _postsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No posts available'));
                }

                List<PostEntity> posts = snapshot.data!;

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
