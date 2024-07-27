import 'package:cjb/pages/auth/user_pref.dart';
import 'package:cjb/pages/main/user_profile/utils/user_preferences.dart';
import 'package:cjb/pages/main/user_profile/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cjb/pages/main/user_profile/profile_page.dart';

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
    if (UserPreferences.myUser != null) {
      await _fetchProfileData();
    } else {
      print('UserPreferences.myUser is null');
    }
  }

  Future<void> _fetchProfileData() async {
    final userId = UserPreferences.myUser?.id ?? '';
    if (userId.isNotEmpty) {
      try {
        final userDoc =
            FirebaseFirestore.instance.collection('profile').doc(userId);
        final snapshot = await userDoc.get();

        if (snapshot.exists) {
          final data = snapshot.data();
          _controllers['About me']?.text = data?['about_me'] ?? '';
          _controllers['Work experience']?.text =
              data?['work_experience'] ?? '';
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
    } else {
      print('User ID is empty');
    }
  }

  Future<void> _uploadProfile() async {
    if (_profileImage == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      // Upload image to Firebase Storage
      final fileName = path.basename(_profileImage!.path);
      final storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');
      final uploadTask = storageReference.putFile(_profileImage!);
      await uploadTask.whenComplete(() => null);
      final downloadURL = await storageReference.getDownloadURL();

      // Save profile data to Firestore
      final userId = UserPreferences.myUser?.id ?? '';
      if (userId.isNotEmpty) {
        final userDoc =
            FirebaseFirestore.instance.collection('profile').doc(userId);

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
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
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
    final user = UserPreferences.myUser;
    return Scaffold(
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
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => ProfilePage()),
                        (route) => false,
                      );
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ],
              ),
              GestureDetector(
                onTap: _pickImage,
                child: ProfileWidget(
                  imagePath: _profileImage != null
                      ? _profileImage!.path
                      : user?.imagePath ?? 'defaultImagePath',
                  onClicked: _pickImage,
                ),
              ),
              _buildProfileListTile(
                context,
                'About me',
                Icon(Icons.account_circle_outlined),
                'assets/vectors/rectangle_16210_x2.svg',
              ),
              _buildProfileListTile(
                context,
                'Work experience',
                Icon(Icons.business_center_rounded),
                'assets/vectors/rectangle_16240_x2.svg',
              ),
              _buildProfileListTile(
                context,
                'Education',
                Icon(Icons.school_outlined),
                'assets/vectors/rectangle_16226_x2.svg',
              ),
              _buildProfileListTile(
                context,
                'Skills',
                Icon(Icons.ac_unit_outlined),
                'assets/vectors/rectangle_1622_x2.svg',
              ),
              _buildProfileListTile(
                context,
                'Hobbies/interests',
                Icon(Icons.favorite_outline),
                'assets/vectors/rectangle_16210_x2.svg',
              ),
              _buildProfileListTile(
                context,
                'Portfolio url',
                Icon(Icons.workspaces_outline),
                'assets/vectors/rectangle_16230_x2.svg',
              ),
              _buildProfileListTile(
                context,
                'job preference',
                Icon(Icons.workspaces_outline),
                'assets/vectors/rectangle_16250_x2.svg',
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

  Widget _buildProfileListTile(
    BuildContext context,
    String title,
    Icon icon,
    String assetPath,
  ) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(title),
          onTap: () {
            _showEditDialog(context, title, _controllers[title]?.text ?? '');
          },
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
                  Navigator.pop(context);
                  setState(() {});
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
