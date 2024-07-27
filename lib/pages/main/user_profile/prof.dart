import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Map<String, TextEditingController> _controllers = {
    'About me': TextEditingController(),
    'Work experience': TextEditingController(),
    'Education': TextEditingController(),
    'Skills': TextEditingController(),
    'Hobbies/interests': TextEditingController(),
    'Portfolio url': TextEditingController(),
    'job preference': TextEditingController(),
  };

  File? _profileImage;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _initializeProfile();
  }

  Future<void> _initializeProfile() async {
    print('Initializing profile...');
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null || userId.isEmpty) {
      print('User ID is empty');
      return;
    }

    print('User ID: $userId');
    await _fetchProfileData(userId);
  }

  Future<void> _fetchProfileData(String userId) async {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(userId);
      final snapshot = await userDoc.get();

      if (snapshot.exists) {
        final data = snapshot.data();
        _controllers['About me']?.text = data?['about_me'] ?? '';
        _controllers['Work experience']?.text = data?['work_experience'] ?? '';
        _controllers['Education']?.text = data?['education'] ?? '';
        _controllers['Skills']?.text = data?['skills'] ?? '';
        _controllers['Hobbies/interests']?.text =
            data?['hobbies_interests'] ?? '';
        _controllers['Portfolio url']?.text = data?['portfolio_url'] ?? '';
        _controllers['job preference']?.text = data?['job_preference'] ?? '';
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }

  Future<void> _uploadProfile() async {
    if (_profileImage == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      print('Uploading profile image...');
      // Compress image
      final compressedImage = await FlutterImageCompress.compressWithFile(
        _profileImage!.path,
        minWidth: 800,
        minHeight: 600,
        quality: 85,
        format: CompressFormat.jpeg,
      );

      if (compressedImage != null) {
        final tempFile =
            File('${(await getTemporaryDirectory()).path}/temp_image.jpg');
        await tempFile.writeAsBytes(compressedImage);

        // Upload image to Firebase Storage
        final fileName = path.basename(tempFile.path);
        final storageReference =
            FirebaseStorage.instance.ref().child('profile_images/$fileName');
        final uploadTask = storageReference.putFile(tempFile);
        await uploadTask.whenComplete(() => null);
        final downloadURL = await storageReference.getDownloadURL();

        print('Uploading profile data...');
        // Save profile data to Firestore
        final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
        if (userId.isNotEmpty) {
          final userDoc =
              FirebaseFirestore.instance.collection('users').doc(userId);

          await userDoc.set({
            'image_path': downloadURL,
            'about_me': _controllers['About me']?.text,
            'work_experience': _controllers['Work experience']?.text,
            'education': _controllers['Education']?.text,
            'skills': _controllers['Skills']?.text,
            'hobbies_interests': _controllers['Hobbies/interests']?.text,
            'portfolio_url': _controllers['Portfolio url']?.text,
            'job_preference': _controllers['job preference']?.text,
          }, SetOptions(merge: true)); // Use merge to update existing document

          setState(() {
            _isUploading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile Uploaded Successfully')));
        } else {
          print('User ID is empty');
        }
      }
    } catch (e) {
      print('Error uploading profile: $e');
      setState(() {
        _isUploading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to Upload Profile')));
    }
  }

  Future<void> _pickImage() async {
    print('Picking image...');
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
        print('Image picked: ${_profileImage!.path}');
      }
    });
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 22),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ],
              ),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : NetworkImage('https://via.placeholder.com/150')
                          as ImageProvider,
                ),
              ),
              _buildProfileListTile(
                context,
                'About me',
                Icon(Icons.account_circle_outlined),
              ),
              _buildProfileListTile(
                context,
                'Work experience',
                Icon(Icons.business_center_rounded),
              ),
              _buildProfileListTile(
                context,
                'Education',
                Icon(Icons.school_outlined),
              ),
              _buildProfileListTile(
                context,
                'Skills',
                Icon(Icons.ac_unit_outlined),
              ),
              _buildProfileListTile(
                context,
                'Hobbies/interests',
                Icon(Icons.favorite_outline),
              ),
              _buildProfileListTile(
                context,
                'Portfolio url',
                Icon(Icons.workspaces_outline),
              ),
              _buildProfileListTile(
                context,
                'job preference',
                Icon(Icons.workspaces_outline),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadProfile,
                child: Text('Upload Profile'),
              ),
              if (_isUploading)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileListTile(BuildContext context, String title, Icon icon) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            _showEditDialog(context, title, _controllers[title]?.text ?? '');
          },
        ),
        if ((_controllers[title]?.text ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              _controllers[title]?.text ?? '',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        Divider(),
      ],
    );
  }

  void _showEditDialog(
      BuildContext context, String field, String initialValue) {
    final controller = _controllers[field];
    if (controller != null) {
      controller.text = initialValue;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit $field'),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter $field',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _controllers[field]?.text = controller.text;
                  });
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    }
  }
}
