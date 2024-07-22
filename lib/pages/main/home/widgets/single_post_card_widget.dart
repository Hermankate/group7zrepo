// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cjb/data/post_entity.dart';
// import 'package:cjb/theme/styles.dart';

// class SinglePostCardWidget extends StatefulWidget {
//   final PostEntity post;
//   const SinglePostCardWidget({super.key, required this.post});

//   @override
//   State<SinglePostCardWidget> createState() => _SinglePostCardWidgetState();
// }

// class _SinglePostCardWidgetState extends State<SinglePostCardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: cjbWhiteFFFFFF,
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 70,
//                     height: 70,
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(35),
//                         child:
//                             Image.asset("assets/${widget.post.userProfile}")),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 "${widget.post.username}",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             GestureDetector(
//                                 onTap: () {
//                                   _openBottomModalSheet();
//                                 },
//                                 child: const Icon(Icons.more_vert))
//                           ],
//                         ),
//                         Text(
//                           "${widget.post.userBio}",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                               fontSize: 12, color: cjbMediumGrey86888A),
//                         ),
//                         const SizedBox(
//                           height: 2,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "${widget.post.createAt} - ",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                   fontSize: 12, color: cjbMediumGrey86888A),
//                             ),
//                             const Icon(
//                               FontAwesomeIcons.earth,
//                               size: 15,
//                               color: cjbMediumGrey86888A,
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "${widget.post.description}",
//                 style: const TextStyle(fontSize: 16),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Wrap(
//                 children: widget.post.tags!.map((tag) {
//                   return Text(
//                     "$tag ",
//                     style: const TextStyle(color: cjbBlue0077B5),
//                   );
//                 }).toList(),
//               )
//             ],
//           ),
//         ),
//         widget.post.postImages!.isEmpty
//             ? Container(
//                 width: double.infinity,
//                 color: cjbMediumGrey86888A,
//                 child: Image.asset("assets/${widget.post.postImage}"),
//               )
//             : SizedBox(
//                 height: 400,
//                 child: Stack(
//                   children: [
//                     PageView(
//                       children: widget.post.postImages!.map((image) {
//                         return Container(
//                           width: double.infinity,
//                           color: cjbMediumGrey86888A,
//                           child: Image.asset(
//                             "assets/$image",
//                             fit: BoxFit.cover,
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                     Positioned(
//                         right: 15,
//                         top: 15,
//                         child: Container(
//                           width: 35,
//                           height: 35,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: cjbWhiteFFFFFF,
//                           ),
//                           child: const Center(
//                             child: Icon(FontAwesomeIcons.images),
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Stack(
//             alignment: Alignment.centerLeft,
//             children: [
//               Positioned(
//                 child: _singleReactItemWidget(
//                     bgColor: Colors.blue.shade200, image: "thumbs_up.png"),
//               ),
//               Positioned(
//                 left: 16,
//                 child: _singleReactItemWidget(
//                     bgColor: Colors.red.shade200, image: "love.png"),
//               ),
//               Positioned(
//                 left: 34,
//                 child: _singleReactItemWidget(
//                     bgColor: Colors.amber.shade200, image: "insightful.png"),
//               ),
//               Positioned(
//                 left: 70,
//                 child: Text("${widget.post.totalReacts}"),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "${widget.post.totalComments} comments - ",
//                     style: const TextStyle(
//                         color: cjbMediumGrey86888A, fontSize: 15),
//                   ),
//                   Text(
//                     "${widget.post.totalReposts} reposts",
//                     style: const TextStyle(
//                         color: cjbMediumGrey86888A, fontSize: 15),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           width: double.infinity,
//           height: 1,
//           color: cjbLightGreyCACCCE,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _singleActionItemWidget(
//                 icon: Icons.thumb_up_alt_outlined, title: "Like"),
//             _singleActionItemWidget(
//                 icon: FontAwesomeIcons.commentDots, title: "Comment"),
//             _singleActionItemWidget(
//                 icon: FontAwesomeIcons.retweet, title: "Repost"),
//             _singleActionItemWidget(
//                 icon: FontAwesomeIcons.paperPlane, title: "Send"),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           width: double.infinity,
//           height: 8,
//           color: cjbLightGreyCACCCE,
//         ),
//       ],
//     );
//   }

//   _singleActionItemWidget({IconData? icon, String? title}) {
//     return Column(
//       children: [
//         Icon(
//           icon,
//           color: cjbMediumGrey86888A,
//         ),
//         Text(
//           "$title",
//           style: const TextStyle(color: cjbMediumGrey86888A),
//         )
//       ],
//     );
//   }

//   _singleReactItemWidget({String? image, Color? bgColor}) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           color: bgColor,
//           shape: BoxShape.circle,
//           border: Border.all(width: 2, color: cjbWhiteFFFFFF)),
//       child: Image.asset(
//         "assets/$image",
//         width: 10,
//         height: 10,
//       ),
//     );
//   }

//   _openBottomModalSheet() {
//     showModalBottomSheet(
//       enableDrag: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           decoration: const BoxDecoration(
//             color: cjbWhiteFFFFFF,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             child: Column(
//               children: [
//                 Center(
//                   child: Container(
//                     width: 70,
//                     height: 6,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: cjbMediumGrey86888A),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 _bottomNavigationItem(
//                     title: "Save", iconData: Icons.bookmark_border),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 _bottomNavigationItem(
//                     title: "Share via", iconData: Icons.share),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 _bottomNavigationItem(
//                     title: "Unfollow", iconData: Icons.cancel),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 _bottomNavigationItem(
//                     title: "Remove connection with ${widget.post.username}",
//                     iconData: Icons.person_remove),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 _bottomNavigationItem(
//                     title: "Mute Username",
//                     iconData: FontAwesomeIcons.volumeXmark),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 _bottomNavigationItem(
//                     title: "Report post", iconData: Icons.flag),
//                 const SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   _bottomNavigationItem({IconData? iconData, String? title}) {
//     return Row(
//       children: [
//         Icon(
//           iconData,
//           size: 25,
//           color: cjbMediumGrey86888A,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Text(
//           "$title",
//           style: const TextStyle(
//               fontSize: 16,
//               color: cjbMediumGrey86888A,
//               fontWeight: FontWeight.bold),
//         )
//       ],
//     );
//   }
// // }

// // import 'package:cjb/data/post_entity.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:cjb/theme/styles.dart';

// // class SinglePostCardWidget extends StatefulWidget {
// //   final PostEntity post;
// //   const SinglePostCardWidget({super.key, required this.post});

// //   @override
// //   State<SinglePostCardWidget> createState() => _SinglePostCardWidgetState();
// // }

// // class _SinglePostCardWidgetState extends State<SinglePostCardWidget> {
//   Future<List<String>> _fetchImageUrls() async {
//     List<String> imageUrls = [];
//     try {
//       QuerySnapshot snapshot =
//           await FirebaseFirestore.instance.collection('posts').get();
//       snapshot.docs.forEach((doc) {
//         final url = doc['imageUrl'];
//         print('Fetched URL: $url'); // Debug statement
//         if (url != null &&
//             url.isNotEmpty &&
//             (url.startsWith('http://') || url.startsWith('https://'))) {
//           imageUrls.add(url);
//         }
//       });
//     } catch (e) {
//       print('Error fetching images: $e');
//     }
//     return imageUrls;
//   }

//   Future<List<String>> _fetchPostImages() async {
//     List<String> imageUrls = [];
//     try {
//       if (widget.post.postImages != null &&
//           widget.post.postImages!.isNotEmpty) {
//         imageUrls = widget.post.postImages!.where((url) {
//           print('Fetching image URL: $url');
//           return url.isNotEmpty;
//         }).toList();
//       } else if (widget.post.postImage != null &&
//           widget.post.postImage!.isNotEmpty) {
//         print('Fetching single image URL: ${widget.post.postImage!}');
//         imageUrls = [widget.post.postImage!];
//       }
//     } catch (e) {
//       print('Error fetching post images: $e');
//     }
//     return imageUrls;
//   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(children: [
// //       Container(
// //         color: cjbWhiteFFFFFF,
// //         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 SizedBox(
// //                   width: 70,
// //                   height: 70,
// //                   child: ClipRRect(
// //                       borderRadius: BorderRadius.circular(35),
// //                       child: widget.post.userProfile != null
// //                           ? Image.network(widget.post.userProfile!)
// //                           : const Icon(Icons.person)),
// //                 ),
// //                 const SizedBox(
// //                   width: 10,
// //                 ),
// //                 Expanded(
// //                   child: Column(
// //                     children: [
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Expanded(
// //                             child: Text(
// //                               widget.post.username ?? '',
// //                               maxLines: 1,
// //                               overflow: TextOverflow.ellipsis,
// //                               style: const TextStyle(
// //                                   fontSize: 16, fontWeight: FontWeight.bold),
// //                             ),
// //                           ),
// //                           GestureDetector(
// //                               onTap: () {
// //                                 _openBottomModalSheet();
// //                               },
// //                               child: const Icon(Icons.more_vert))
// //                         ],
// //                       ),
// //                       Text(
// //                         widget.post.userBio ?? '',
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis,
// //                         style: const TextStyle(
// //                             fontSize: 12, color: cjbMediumGrey86888A),
// //                       ),
// //                       const SizedBox(
// //                         height: 2,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Text(
// //                             widget.post.createAt ?? '',
// //                             maxLines: 1,
// //                             overflow: TextOverflow.ellipsis,
// //                             style: const TextStyle(
// //                                 fontSize: 12, color: cjbMediumGrey86888A),
// //                           ),
// //                           const Icon(
// //                             FontAwesomeIcons.earth,
// //                             size: 15,
// //                             color: cjbMediumGrey86888A,
// //                           )
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 )
// //               ],
// //             ),
// //             const SizedBox(
// //               height: 10,
// //             ),
// //             Text(
// //               widget.post.description ?? '',
// //               style: const TextStyle(fontSize: 16),
// //             ),
// //             const SizedBox(
// //               height: 10,
// //             ),
// //             Wrap(
// //               children: widget.post.tags?.map((tag) {
// //                     return Text(
// //                       "$tag ",
// //                       style: const TextStyle(color: cjbBlue0077B5),
// //                     );
// //                   }).toList() ??
// //                   [],
// //             )
// //           ],
// //         ),
// //       ),
// //       FutureBuilder<List<String>>(
// //         future: _fetchImageUrls(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             print('Snapshot Error: ${snapshot.error}'); // Debug statement
// //             return const Center(child: Text('Error fetching images'));
// //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //             return const Center(child: Text('No images found'));
// //           } else {
// //             List<String> imageUrls = snapshot.data!;
// //             print('Image URLs: $imageUrls'); // Debug statement
// //             return SizedBox(
// //               height: 400,
// //               child: Stack(
// //                 children: [
// //                   PageView(
// //                     children: imageUrls.map((image) {
// //                       return Container(
// //                         width: double.infinity,
// //                         color: Colors.grey,
// //                         child: Image.network(
// //                           image,
// //                           fit: BoxFit.cover,
// //                           errorBuilder: (context, error, stackTrace) {
// //                             return const Center(child: Icon(Icons.error));
// //                           },
// //                         ),
// //                       );
// //                     }).toList(),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           }
// //         },
// //       ),
// //       Positioned(
// //           right: 15,
// //           top: 15,
// //           child: Container(
// //             width: 35,
// //             height: 35,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(10),
// //               color: cjbWhiteFFFFFF,
// //             ),
// //             child: const Center(
// //               child: Icon(FontAwesomeIcons.images),
// //             ),
// //           ))
// //     ]);

// //     const SizedBox(
// //       height: 10,
// //     );
// //     Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //       child: Stack(
// //         alignment: Alignment.centerLeft,
// //         children: [
// //           Positioned(
// //             child: _singleReactItemWidget(
// //                 bgColor: Colors.blue.shade200, image: "thumbs_up.png"),
// //           ),
// //           Positioned(
// //             left: 16,
// //             child: _singleReactItemWidget(
// //                 bgColor: Colors.red.shade200, image: "love.png"),
// //           ),
// //           Positioned(
// //             left: 34,
// //             child: _singleReactItemWidget(
// //                 bgColor: Colors.amber.shade200, image: "insightful.png"),
// //           ),
// //           Positioned(
// //             left: 70,
// //             child: Text(
// //               "${widget.post.totalReacts} Reactions",
// //               style: const TextStyle(color: cjbMediumGrey86888A),
// //             ),
// //           ),
// //           Align(
// //             alignment: Alignment.centerRight,
// //             child: Text(
// //               "${widget.post.totalComments} Comments - ${widget.post.totalReposts} Reposts",
// //               style: const TextStyle(color: cjbMediumGrey86888A),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //     const SizedBox(
// //       height: 10,
// //     );
// //   }

// //   _singleReactItemWidget(
// //       {required Color bgColor, required String image, Function? onTap}) {
// //     return Container(
// //       width: 24,
// //       height: 24,
// //       decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(12), color: bgColor),
// //       child: Image.asset("assets/$image"),
// //     );
// //   }

// //   _openBottomModalSheet() {
// //     showModalBottomSheet(
// //         context: context,
// //         builder: (context) {
// //           return Container(
// //             color: cjbLightGreyCACCCE,
// //             child: Wrap(
// //               children: [
// //                 ListTile(
// //                   onTap: () {},
// //                   leading: const Icon(Icons.flag),
// //                   title: const Text("Report this post"),
// //                 )
// //               ],
// //             ),
// //           );
// //         });
// //   }
// // }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cjb/data/post_entity.dart';
import 'package:cjb/theme/styles.dart';

class SinglePostCardWidget extends StatefulWidget {
  final PostEntity post;
  const SinglePostCardWidget({super.key, required this.post});

  @override
  State<SinglePostCardWidget> createState() => _SinglePostCardWidgetState();
}

class _SinglePostCardWidgetState extends State<SinglePostCardWidget> {
  Future<List<String>> _fetchPostImages() async {
    List<String> imageUrls = [];
    try {
      print('Post Images: ${widget.post.postImages}'); // Debug statement
      print('Post Image: ${widget.post.postImage}'); // Debug statement

      // Check if postImages is not null and has items
      if (widget.post.postImages != null &&
          widget.post.postImages!.isNotEmpty) {
        imageUrls = widget.post.postImages!.where((url) {
          print('Fetching image URL: $url'); // Debug statement
          return url.isNotEmpty &&
              (url.startsWith('http://') || url.startsWith('https://'));
        }).toList();
      }
      // Check if postImage is not null and not empty
      else if (widget.post.postImage != null &&
          widget.post.postImage!.isNotEmpty) {
        print(
            'Fetching single image URL: ${widget.post.postImage!}'); // Debug statement
        imageUrls = [widget.post.postImage!];
      }
    } catch (e) {
      print('Error fetching post images: $e');
    }
    print('Image URLs: $imageUrls'); // Debug statement
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: cjbWhiteFFFFFF,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: widget.post.userProfile != null
                          ? Image.network(
                              widget.post.userProfile!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.person);
                              },
                            )
                          : const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.post.username ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _openBottomModalSheet();
                              },
                              child: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                        Text(
                          widget.post.userBio ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, color: cjbMediumGrey86888A),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              widget.post.createAt ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12, color: cjbMediumGrey86888A),
                            ),
                            const Icon(
                              FontAwesomeIcons.earth,
                              size: 15,
                              color: cjbMediumGrey86888A,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.post.description ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Wrap(
                children: widget.post.tags?.map((tag) {
                      return Text(
                        "$tag ",
                        style: const TextStyle(color: cjbBlue0077B5),
                      );
                    }).toList() ??
                    [],
              ),
            ],
          ),
        ),
        FutureBuilder<List<String>>(
          future: _fetchPostImages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print('Snapshot Error: ${snapshot.error}');
              return const Center(child: Text('Error fetching images'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Container(
                width: double.infinity,
                color: cjbMediumGrey86888A,
                child: Center(child: Text('No images available')),
              );
            } else {
              List<String> imageUrls = snapshot.data!;
              return SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          color: cjbMediumGrey86888A,
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(child: Icon(Icons.error));
                            },
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 15,
                      top: 15,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cjbWhiteFFFFFF,
                        ),
                        child: const Center(
                          child: Icon(FontAwesomeIcons.images),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                child: _singleReactItemWidget(
                    bgColor: Colors.blue.shade200, image: "thumbs_up.png"),
              ),
              Positioned(
                left: 16,
                child: _singleReactItemWidget(
                    bgColor: Colors.red.shade200, image: "love.png"),
              ),
              Positioned(
                left: 34,
                child: _singleReactItemWidget(
                    bgColor: Colors.amber.shade200, image: "insightful.png"),
              ),
              Positioned(
                left: 70,
                child: Text("${widget.post.totalReacts}"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.post.totalComments} comments - ",
                    style: const TextStyle(
                        color: cjbMediumGrey86888A, fontSize: 15),
                  ),
                  Text(
                    "${widget.post.totalReposts} reposts",
                    style: const TextStyle(
                        color: cjbMediumGrey86888A, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 1,
          color: cjbLightGreyCACCCE,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _singleActionItemWidget(
                icon: Icons.thumb_up_alt_outlined, title: "Like"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.commentDots, title: "Comment"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.retweet, title: "Repost"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.paperPlane, title: "Send"),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 8,
          color: cjbLightGreyCACCCE,
        ),
      ],
    );
  }

  _singleActionItemWidget({IconData? icon, String? title}) {
    return Column(
      children: [
        Icon(
          icon,
          color: cjbMediumGrey86888A,
        ),
        Text(
          "$title",
          style: const TextStyle(color: cjbMediumGrey86888A),
        ),
      ],
    );
  }

  _singleReactItemWidget({String? image, Color? bgColor}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: cjbWhiteFFFFFF),
      ),
      child: Image.asset(
        "assets/$image",
        width: 10,
        height: 10,
      ),
    );
  }

  _openBottomModalSheet() {
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
            color: cjbWhiteFFFFFF,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 70,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: cjbMediumGrey86888A),
                ),
              ),
              const SizedBox(height: 40),
              _bottomNavigationItem(
                  title: "Save", iconData: Icons.bookmark_border),
              const SizedBox(height: 30),
              _bottomNavigationItem(title: "Share via", iconData: Icons.share),
              const SizedBox(height: 30),
              _bottomNavigationItem(title: "Unfollow", iconData: Icons.cancel),
              const SizedBox(height: 30),
              _bottomNavigationItem(
                  title: "Remove connection with ${widget.post.username}",
                  iconData: Icons.person_remove),
              const SizedBox(height: 30),
              _bottomNavigationItem(
                  title: "Mute Username",
                  iconData: FontAwesomeIcons.volumeXmark),
              const SizedBox(height: 30),
              _bottomNavigationItem(title: "Report post", iconData: Icons.flag),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationItem({IconData? iconData, String? title}) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 25,
          color: cjbMediumGrey86888A,
        ),
        const SizedBox(width: 10),
        Text(
          "$title",
          style: const TextStyle(
              fontSize: 16,
              color: cjbMediumGrey86888A,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
