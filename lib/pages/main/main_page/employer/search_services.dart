import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeSearchService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> searchEmployees({
    String? name,
    String? location,
    List<String>? gender,
    List<String>? skills,
    String? workExperience,
    String? education,
    String? jobPreferences,
    String? ageRange,
    List<String>? certifications,
    String? availability,
  }) async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();
    List<Map<String, dynamic>> allUsers = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    print('Total users fetched: ${allUsers.length}');

    List<Map<String, dynamic>> matchingUsers = allUsers.where((user) {
      print('Evaluating user: $user'); // Print the user data

      int matchCount = 0;

      if (name != null && name.isNotEmpty && user['name'] == name) {
        matchCount++;
        print('Matched name: ${user['name']}');
      } else if (name != null && name.isNotEmpty) {
        print('Name does not match: ${user['name']}');
      }

      if (location != null &&
          location.isNotEmpty &&
          user['location'] == location) {
        matchCount++;
        print('Matched location: ${user['location']}');
      } else if (location != null && location.isNotEmpty) {
        print('Location does not match: ${user['location']}');
      }

      if (gender != null &&
          gender.isNotEmpty &&
          gender.any((g) => user['gender'] == g)) {
        matchCount++;
        print('Matched gender: ${user['gender']}');
      } else if (gender != null && gender.isNotEmpty) {
        print('Gender does not match: ${user['gender']}');
      }

      if (skills != null && skills.isNotEmpty) {
        if (user['skills'] is List) {
          if (skills.any((skill) => (user['skills'] as List).contains(skill))) {
            matchCount++;
            print('Matched skills: ${user['skills']}');
          } else {
            print('Skills do not match: ${user['skills']}');
          }
        } else if (user['skills'] is String) {
          if (skills.contains(user['skills'])) {
            matchCount++;
            print('Matched skill: ${user['skills']}');
          } else {
            print('Skill does not match: ${user['skills']}');
          }
        }
      }

      if (workExperience != null &&
          workExperience.isNotEmpty &&
          user['workExperience'] == workExperience) {
        matchCount++;
        print('Matched workExperience: ${user['workExperience']}');
      } else if (workExperience != null && workExperience.isNotEmpty) {
        print('Work experience does not match: ${user['workExperience']}');
      }

      if (education != null &&
          education.isNotEmpty &&
          user['education'] == education) {
        matchCount++;
        print('Matched education: ${user['education']}');
      } else if (education != null && education.isNotEmpty) {
        print('Education does not match: ${user['education']}');
      }

      if (jobPreferences != null &&
          jobPreferences.isNotEmpty &&
          user['jobPreferences'] == jobPreferences) {
        matchCount++;
        print('Matched jobPreferences: ${user['jobPreferences']}');
      } else if (jobPreferences != null && jobPreferences.isNotEmpty) {
        print('Job preferences do not match: ${user['jobPreferences']}');
      }

      if (ageRange != null &&
          ageRange.isNotEmpty &&
          user['ageRange'] == ageRange) {
        matchCount++;
        print('Matched ageRange: ${user['ageRange']}');
      } else if (ageRange != null && ageRange.isNotEmpty) {
        print('Age range does not match: ${user['ageRange']}');
      }

      if (certifications != null && certifications.isNotEmpty) {
        if (user['certifications'] is List) {
          if (certifications
              .any((cert) => (user['certifications'] as List).contains(cert))) {
            matchCount++;
            print('Matched certifications: ${user['certifications']}');
          } else {
            print('Certifications do not match: ${user['certifications']}');
          }
        } else if (user['certifications'] is String) {
          if (certifications.contains(user['certifications'])) {
            matchCount++;
            print('Matched certification: ${user['certifications']}');
          } else {
            print('Certification does not match: ${user['certifications']}');
          }
        }
      }

      if (availability != null &&
          availability.isNotEmpty &&
          user['availability'] == availability) {
        matchCount++;
        print('Matched availability: ${user['availability']}');
      } else if (availability != null && availability.isNotEmpty) {
        print('Availability does not match: ${user['availability']}');
      }

      return matchCount >= 2; // Ensure at least two criteria match
    }).toList();

    print('Total matching users: ${matchingUsers.length}');
    return matchingUsers;
  }
}
