import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeSearchService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> searchEmployees({
    String? name,
    String? location,
    String? jobTitle,
    List<String>? skills,
    String? workExperience,
    String? education,
    String? jobPreferences,
    List<String>? languages,
    List<String>? certifications,
    String? availability,
  }) async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();
    List<Map<String, dynamic>>? allUsers = querySnapshot.docs
        .map((doc) => doc.data())
        .cast<Map<String, dynamic>>()
        .toList();

    List<Map<String, dynamic>> matchingUsers = allUsers.where((user) {
      int matchCount = 0;
      if (name != null && name.isNotEmpty && user['name'] == name) matchCount++;
      if (location != null &&
          location.isNotEmpty &&
          user['location'] == location) matchCount++;
      if (jobTitle != null &&
          jobTitle.isNotEmpty &&
          user['jobTitle'] == jobTitle) matchCount++;
      if (skills != null &&
          skills.isNotEmpty &&
          skills.any((skill) => user['skills'].contains(skill))) matchCount++;
      if (workExperience != null &&
          workExperience.isNotEmpty &&
          user['workExperience'] == workExperience) matchCount++;
      if (education != null &&
          education.isNotEmpty &&
          user['education'] == education) matchCount++;
      if (jobPreferences != null &&
          jobPreferences.isNotEmpty &&
          user['jobPreferences'] == jobPreferences) matchCount++;
      if (languages != null &&
          languages.isNotEmpty &&
          languages.any((language) => user['languages'].contains(language)))
        matchCount++;
      if (certifications != null &&
          certifications.isNotEmpty &&
          certifications.any((cert) => user['certifications'].contains(cert)))
        matchCount++;
      if (availability != null &&
          availability.isNotEmpty &&
          user['availability'] == availability) matchCount++;

      return matchCount >= 3;
    }).toList();

    return matchingUsers;
  }
}
