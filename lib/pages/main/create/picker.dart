import 'package:cjb/pages/main/create/create_page.dart';
import 'package:cjb/pages/main/create/picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class _CreatePageState extends State<CreatePage> {
  // Other existing code...

  List<String> postImages = [];
  File? videoFile;

  Future<void> _pickPostImage() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? selectedImages = await _picker.pickMultiImage();

    if (selectedImages != null) {
      for (var image in selectedImages) {
        setState(() {
          postImages.add(image.path);
        });
      }
      print('Selected images: $postImages');
    }
  }

  Future<void> _pickPostVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedVideo =
        await _picker.pickVideo(source: ImageSource.gallery);

    if (selectedVideo != null) {
      setState(() {
        videoFile = File(selectedVideo.path);
      });
      print('Selected video: ${videoFile!.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // Other existing code...
}
