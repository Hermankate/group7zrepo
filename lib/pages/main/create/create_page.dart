// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cjb/pages/main/create/add_job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPostScreen extends StatefulWidget {
  final VoidCallback? onCloneClickListener;
  const AddPostScreen({super.key, required this.onCloneClickListener});
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitPost() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    // Add your post submission logic here
    print('Title: $title');
    print('Description: $description');
  }

  void _openCamera() {
    // Add your camera functionality here
    print('Camera opened');
  }

  void _openGallery() {
    // Add your gallery functionality here
    print('Gallery opened');
  }

  @override
  Widget build(BuildContext context) {
    var _postimage;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFF524B6B),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: 18.2,
                        height: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Post',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFFFF9228),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Add Post',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFF150B3D),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 28.0),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/holder.jpeg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username ',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xFF150B3D),
                        ),
                      ),
                      Text(
                        'email@gmail.com',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF524B6B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF150B3D),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 5,
                    minLines: 2,
                    decoration: InputDecoration(
                      hintText: 'What do you want to talk about?',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.white,
                child: _postimage,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26ACC8D3),
                    offset: Offset(0, 4),
                    blurRadius: 79.5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20.6, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.business_center_rounded),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddAjob(),
                                  ),
                                );
                              },
                            ),
                            Text('Job'),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon:
                                  Icon(Icons.photo_size_select_actual_rounded),
                              onPressed: _openGallery,
                            ),
                            Text('Media'),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: _submitPost,
                      child: Container(
                        width: 124,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9228),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Center(
                          child: Text(
                            'Post',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cjb/theme/styles.dart';

// class CreatePage extends StatefulWidget {
//   final VoidCallback? onCloneClickListener;
//   const CreatePage({Key? key, required this.onCloneClickListener})
//       : super(key: key);

//   @override
//   State<CreatePage> createState() => _CreatePageState();
// }

// class _CreatePageState extends State<CreatePage> {
//   final TextEditingController _postBodyController = TextEditingController();

//   bool _openTwoBottomModalSheetsOnce = false;

//   final FocusScopeNode _subPostBottomModalSheetFocusNode = FocusScopeNode();
//   final FocusScopeNode _superPostBottomModalSheetFocusNode = FocusScopeNode();

//   @override
//   void dispose() {
//     _postBodyController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_openTwoBottomModalSheetsOnce == false) {
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         _createSuperPostBottomModalSheet();
//         _createSubPostBottomModalSheet();
//         print("value before = $_openTwoBottomModalSheetsOnce");
//         setState(() {
//           _openTwoBottomModalSheetsOnce = true;
//         });
//         print("value after = $_openTwoBottomModalSheetsOnce");
//       });
//     }

//     return const Scaffold();
//   }

//   _createSuperPostBottomModalSheet() {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       enableDrag: false,
//       isDismissible: false,
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//             builder: (context, void Function(void Function()) setState) {
//           return FocusScope(
//             node: _superPostBottomModalSheetFocusNode,
//             child: Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     width: double.infinity,
//                     height: 110,
//                     decoration:
//                         const BoxDecoration(color: cjbWhiteFFFFFF, boxShadow: [
//                       BoxShadow(
//                           offset: Offset(0, 2),
//                           color: cjbLightGreyCACCCE,
//                           blurRadius: 5,
//                           spreadRadius: 0.1),
//                     ]),
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 15.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               GestureDetector(
//                                   onTap: widget.onCloneClickListener,
//                                   child: const Icon(
//                                     Icons.close_outlined,
//                                     size: 30,
//                                   )),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               const Text(
//                                 "Share Post",
//                                 style: TextStyle(
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold,
//                                     color: cjbMediumGrey86888A),
//                               )
//                             ],
//                           ),
//                           Text(
//                             "Post",
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: _postBodyController.text.isEmpty
//                                     ? cjbLightGreyCACCCE
//                                     : cjbBlue0077B5),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Expanded(
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 60,
//                                   height: 60,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(30),
//                                     child: Image.asset("assets/profile_1.jpeg"),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     _switchWidget(
//                                         title: "Doug Stevenson",
//                                         prefixIcon:
//                                             Icons.account_circle_rounded,
//                                         suffixIcon:
//                                             Icons.arrow_drop_down_outlined),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     _switchWidget(
//                                         title: "Anyone",
//                                         prefixIcon: FontAwesomeIcons.earth,
//                                         suffixIcon:
//                                             Icons.arrow_drop_down_outlined),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               controller: _postBodyController,
//                               onTap: () {
//                                 _postBodyController.addListener(() {
//                                   if (_postBodyController.text.length == 1) {
//                                     setState(() {});
//                                     print("call first IF setState");
//                                   } else if (_postBodyController.text.isEmpty) {
//                                     setState(() {});
//                                     print("2nd ELSE IF setState");
//                                   }

//                                   print("onTap called");
//                                 });
//                               },
//                               style: const TextStyle(fontSize: 22),
//                               maxLines: 15,
//                               decoration: const InputDecoration(
//                                   hintText: "What do you want to talk about?",
//                                   border: InputBorder.none),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.camera_alt,
//                               color: cjbMediumGrey86888A,
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             const Icon(
//                               Icons.video_call,
//                               color: cjbMediumGrey86888A,
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             const Icon(
//                               Icons.image,
//                               color: cjbMediumGrey86888A,
//                             ),
//                             const SizedBox(
//                               width: 25,
//                             ),
//                             GestureDetector(
//                                 onTap: () {
//                                   _createSubPostBottomModalSheet();
//                                 },
//                                 child: const Icon(
//                                   Icons.more_horiz,
//                                   color: cjbMediumGrey86888A,
//                                 )),
//                           ],
//                         ),
//                         const Row(
//                           children: [
//                             Icon(
//                               Icons.message_outlined,
//                               color: cjbMediumGrey86888A,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Anyone",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: cjbMediumGrey86888A),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//       },
//     ).then((value) {
//       _superPostBottomModalSheetFocusNode.unfocus();
//     });
//   }

//   _switchWidget({String? title, IconData? prefixIcon, IconData? suffixIcon}) {
//     return Container(
//       height: 30,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(width: 1, color: cjbMediumGrey86888A)),
//       child: Row(
//         children: [
//           Icon(
//             prefixIcon,
//             color: cjbMediumGrey86888A,
//             size: 18,
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Text(
//             "$title",
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Icon(
//             suffixIcon,
//             size: 30,
//           ),
//         ],
//       ),
//     );
//   }

//   _createSubPostBottomModalSheet() {
//     showModalBottomSheet(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       barrierColor: Colors.transparent,
//       context: context,
//       builder: (context) {
//         return FocusScope(
//           node: _subPostBottomModalSheetFocusNode,
//           child: Container(
//             decoration: BoxDecoration(color: cjbWhiteFFFFFF, boxShadow: [
//               BoxShadow(
//                   offset: const Offset(5, 0),
//                   blurRadius: 1,
//                   color: cjbLightGreyCACCCE.withOpacity(.6),
//                   spreadRadius: 0.5)
//             ]),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Container(
//                         width: 80,
//                         height: 6,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: cjbMediumGrey86888A),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     _createSubPostNavigationItem(
//                         title: "Add a photo/ photos", iconData: Icons.image),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     _createSubPostNavigationItem(
//                         title: "Take a video", iconData: Icons.video_call),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     _createSubPostNavigationItem(
//                         title: "Add a document",
//                         iconData: Icons.document_scanner),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     _createSubPostNavigationItem(
//                         title: "Add attachment",
//                         iconData: Icons.assignment_outlined),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     ).then((value) {
//       _subPostBottomModalSheetFocusNode.unfocus();
//     });
//   }

//   _createSubPostNavigationItem({IconData? iconData, String? title}) {
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
// }

// // import 'package:cjb/pages/main/create/picker.dart';
// // import 'package:flutter/material.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:cjb/theme/styles.dart';
// // import 'dart:io';
// // import 'package:file_picker/file_picker.dart';

// // // class CreatePage extends StatefulWidget {
// // //   final VoidCallback? onCloneClickListener;

// // //   const CreatePage({Key? key, required this.onCloneClickListener})
// // //       : super(key: key);

// // //   @override
// // //   State<CreatePage> createState() => _CreatePageState();
// // // }

// // // class _CreatePageState extends State<CreatePage> {
// // //   final TextEditingController _usernameController = TextEditingController();
// // //   final TextEditingController _userProfileController = TextEditingController();
// // //   final TextEditingController _userBioController = TextEditingController();
// // //   final TextEditingController _descriptionController = TextEditingController();
// // //   final TextEditingController _tagController = TextEditingController();

// // //   List<String> _postImages = [];
// // //   File? videoFile;
// // //   bool _modalSheetsInitialized = false;

// // //   final FocusScopeNode _subPostFocusNode = FocusScopeNode();
// // //   final FocusScopeNode _superPostFocusNode = FocusScopeNode();

// // //   @override
// // //   void dispose() {
// // //     _usernameController.dispose();
// // //     _userProfileController.dispose();
// // //     _userBioController.dispose();
// // //     _descriptionController.dispose();
// // //     _tagController.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (!_modalSheetsInitialized) {
// // //       WidgetsBinding.instance.addPostFrameCallback((_) {
// // //         _showSuperPostModalSheet();
// // //         _showSubPostModalSheet();
// // //         setState(() {
// // //           _modalSheetsInitialized = true;
// // //         });
// // //       });
// // //     }

// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text('Create Post')),
// // //       body: Padding(
// // //         padding: const EdgeInsets.symmetric(horizontal: 20),
// // //         child: Column(
// // //           children: [
// // //             const SizedBox(height: 20),
// // //             _buildTextField(_usernameController, "Username"),
// // //             _buildTextField(_userProfileController, "User Profile Image URL"),
// // //             _buildTextField(_userBioController, "User Bio"),
// // //             _buildTextField(_descriptionController, "Job Description",
// // //                 maxLines: 5),
// // //             _buildTextField(_tagController, "Tags (comma-separated)"),
// // //             const SizedBox(height: 20),
// // //             _buildImagePreview(),
// // //             const SizedBox(height: 20),
// // //             _buildPickImageButton(),
// // //             const SizedBox(height: 10),
// // //             _buildPickVideoButton(),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTextField(TextEditingController controller, String hint,
// // //       {int maxLines = 1}) {
// // //     return TextFormField(
// // //       controller: controller,
// // //       maxLines: maxLines,
// // //       decoration: InputDecoration(hintText: hint),
// // //     );
// // //   }

// // //   Widget _buildImagePreview() {
// // //     return Wrap(
// // //       children: _postImages.map((image) {
// // //         return Padding(
// // //           padding: const EdgeInsets.all(4.0),
// // //           child: Image.file(File(image), width: 50, height: 50),
// // //         );
// // //       }).toList(),
// // //     );
// // //   }

// // //   Widget _buildPickImageButton() {
// // //     return ElevatedButton(
// // //       onPressed: _pickPostImage,
// // //       child: const Text("Pick Image"),
// // //     );
// // //   }

// // //   Widget _buildPickVideoButton() {
// // //     return ElevatedButton(
// // //       onPressed: _pickPostVideo,
// // //       child: const Text("Pick Video"),
// // //     );
// // //   }

// // //   void _showSuperPostModalSheet() {
// // //     showModalBottomSheet(
// // //       isScrollControlled: true,
// // //       enableDrag: false,
// // //       isDismissible: false,
// // //       context: context,
// // //       builder: (context) {
// // //         return StatefulBuilder(
// // //           builder: (context, setState) {
// // //             return FocusScope(
// // //               node: _superPostFocusNode,
// // //               child: Container(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 20),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     _buildSuperPostHeader(),
// // //                     const SizedBox(height: 30),
// // //                     Expanded(
// // //                         child: Container()), // Placeholder for other content
// // //                     const SizedBox(height: 30),
// // //                   ],
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         );
// // //       },
// // //     ).then((_) => _superPostFocusNode.unfocus());
// // //   }

// // //   Widget _buildSuperPostHeader() {
// // //     return Container(
// // //       height: 110,
// // //       decoration: const BoxDecoration(
// // //         color: cjbWhiteFFFFFF,
// // //         boxShadow: [
// // //           BoxShadow(
// // //             offset: Offset(0, 2),
// // //             color: cjbLightGreyCACCCE,
// // //             blurRadius: 5,
// // //             spreadRadius: 0.1,
// // //           ),
// // //         ],
// // //       ),
// // //       child: Padding(
// // //         padding: const EdgeInsets.only(bottom: 15.0),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           children: [
// // //             Row(
// // //               children: [
// // //                 GestureDetector(
// // //                   onTap: widget.onCloneClickListener,
// // //                   child: const Icon(Icons.close_outlined, size: 30),
// // //                 ),
// // //                 const SizedBox(width: 15),
// // //                 const Text(
// // //                   "Share Post",
// // //                   style: TextStyle(
// // //                       fontSize: 25,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: cjbMediumGrey86888A),
// // //                 ),
// // //               ],
// // //             ),
// // //             Text(
// // //               "Post",
// // //               style: TextStyle(
// // //                 fontSize: 22,
// // //                 fontWeight: FontWeight.bold,
// // //                 color: _descriptionController.text.isEmpty
// // //                     ? cjbLightGreyCACCCE
// // //                     : cjbBlue0077B5,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// //   Future<void> _pickPostImage() async {
// //     final picker = ImagePicker();
// //     final List<XFile>? selectedImages = await picker.pickMultiImage();

// //     if (selectedImages != null) {
// //       setState(() {
// //         _postImages.addAll(selectedImages.map((image) => image.path));
// //       });
// //     }
// //   }

// //   Future<void> _pickPostVideo() async {
// //     final picker = ImagePicker();
// //     final XFile? selectedVideo =
// //         await picker.pickVideo(source: ImageSource.gallery);

// //     if (selectedVideo != null) {
// //       setState(() {
// //         videoFile = File(selectedVideo.path);
// //       });
// //       print('Selected video: ${videoFile!.path}');
// //     }
// //   }

// // //   void _showSubPostModalSheet() {
// // //     showModalBottomSheet(
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //       barrierColor: Colors.transparent,
// // //       context: context,
// // //       builder: (context) {
// // //         return FocusScope(
// // //           node: _subPostFocusNode,
// // //           child: Container(
// // //             decoration: BoxDecoration(color: cjbWhiteFFFFFF, boxShadow: [
// // //               BoxShadow(
// // //                 offset: const Offset(5, 0),
// // //                 blurRadius: 1,
// // //                 color: cjbLightGreyCACCCE.withOpacity(.6),
// // //                 spreadRadius: 0.5,
// // //               ),
// // //             ]),
// // //             child: Padding(
// // //               padding:
// // //                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
// // //               child: SingleChildScrollView(
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Center(
// // //                       child: Container(
// // //                         width: 80,
// // //                         height: 6,
// // //                         decoration: BoxDecoration(
// // //                           borderRadius: BorderRadius.circular(10),
// // //                           color: cjbMediumGrey86888A,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                    // ..._buildSubPostNavigationItems(),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     ).then((_) => _subPostFocusNode.unfocus());
// // //   }

// // //   // List<Widget> _buildSubPostNavigationItems() {
// // //   //   final items = [
// // //   //     {"title": "Add a photo/ photos", "icon": Icons.image},
// // //   //     {"title": "Take a video", "icon": Icons.video_call},
// // //   //     {"title": "Add a document", "icon": Icons.document_scanner},
// // //   //     {"title": "Attach a file", "icon": Icons.assignment_outlined},
// // //   //   ];

// // //   //   return items.map((item) {
// // //   //     return GestureDetector(
// // //   //       onTap: () {
// // //   //         switch (item["title"]) {
// // //   //           case "Add a photo/ photos":
// // //   //             _pickPostImage();
// // //   //             break;
// // //   //           case "Take a video":
// // //   //             _pickPostVideo();
// // //   //             break;
// // //   //           case "Add a document":
// // //   //             _pickDocument();
// // //   //             break;
// // //   //           case "Attach a file":
// // //   //             _attachFile();
// // //   //             break;
// // //   //         }
// // //   //       },
// // //   //       child: Row(
// // //   //         children: [
// // //   //           Icon(item["icon"] as IconData?,
// // //   //               size: 25, color: cjbMediumGrey86888A),
// // //   //           const SizedBox(width: 10),
// // //   //           Text(
// // //   //             item["title"] as String,
// // //   //             style: const TextStyle(
// // //   //                 fontSize: 16,
// // //   //                 color: cjbMediumGrey86888A,
// // //   //                 fontWeight: FontWeight.bold),
// // //   //           ),
// // //   //         ],
// // //   //       ),
// // //   //     );
// // //   //   }).toList();
// // //   // }

// //   Future<void> _pickDocument() async {
// //     FilePickerResult? result =
// //         await FilePicker.platform.pickFiles(type: FileType.any);

// //     if (result != null && result.files.isNotEmpty) {
// //       print('Selected document: ${result.files.single.path}');
// //       // Handle the selected document here
// //     }
// //   }

// //   Future<void> _attachFile() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles();

// //     if (result != null && result.files.isNotEmpty) {
// //       print('Attached file: ${result.files.single.path}');
// //       // Handle the attached file here
// //     }
// //   }
// // }
