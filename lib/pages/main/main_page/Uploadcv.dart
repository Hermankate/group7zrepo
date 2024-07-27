// ignore_for_file: prefer_const_constructors

import 'package:cjb/pages/main/home/home_page.dart';
import 'package:cjb/pages/main/main_page/joblist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CV_page extends StatefulWidget {
  const CV_page({Key? key}) : super(key: key);

  @override
  State<CV_page> createState() => _CV_pageState();
}

class _CV_pageState extends State<CV_page> {
  File? selectedFile;
  String? fileName;
  bool isUploading = false;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
        fileName = result.files.single.name;
      });
    }
  }

  Future<void> uploadFile() async {
    if (selectedFile == null) return;

    setState(() {
      isUploading = true;
    });

    try {
      // Upload file to Firebase Storage
      String filePath =
          'uploads/${DateTime.now().millisecondsSinceEpoch}_$fileName';
      UploadTask uploadTask =
          FirebaseStorage.instance.ref(filePath).putFile(selectedFile!);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Save the URL in Firestore
      await FirebaseFirestore.instance.collection('uploaded_cvs').add({
        'file_name': fileName,
        'download_url': downloadUrl,
        'uploaded_at': Timestamp.now(),
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('File uploaded successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to upload file: $e')));
    } finally {
      setState(() {
        isUploading = false;
        selectedFile = null;
        fileName = null;
      });
    }
  }

  void removeFile() {
    setState(() {
      selectedFile = null;
      fileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 42, 20, 90),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(2.8, 0, 2.8, 50.5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 24,
                      height: 24,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => JobsList(),
                            ),
                            (route) => false,
                          );
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 29),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        'Add Resume',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF150A33),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                      child: SizedBox(
                                        width: 44,
                                        height: 44,
                                        child: Image(
                                          image: AssetImage(
                                            'assets/pdf.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(fileName ??
                                                    'No file selected'),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                  onPressed: pickFile,
                                                  child: Text('Pick file'))
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if (selectedFile != null)
                              Container(
                                margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: ClipRect(
                                            child: Align(
                                              widthFactor: 1000,
                                              heightFactor: 1000,
                                              child: Icon(Icons
                                                  .delete_forever_outlined),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                        child: InkWell(
                                          onTap: removeFile,
                                          child: Text(
                                            'Remove file',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color(0xFFFC4646),
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
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Upload files in PDF format up to 5 MB. Just upload it once and you can use it in your next application.',
                      style: GoogleFonts.getFont(
                        'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color(0xFFAAA6B9),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF0060F3),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x2E99ABC6),
                          offset: Offset(0, 4),
                          blurRadius: 31,
                        ),
                      ],
                    ),
                    child: Container(
                      width: 213,
                      padding: EdgeInsets.fromLTRB(6.0, 12, 0, 12),
                      child: Center(
                        child: isUploading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : TextButton(
                                onPressed: uploadFile,
                                child: Text(
                                  'Upload',
                                  style: GoogleFonts.getFont(
                                    'DM Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    letterSpacing: 0.8,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
