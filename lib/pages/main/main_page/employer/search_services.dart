import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeSearchService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> searchEmployees({
    String? name,
    String? location,
    List<String>? gender,
    String? jobPreferences,
    List<String>? skills,
    String? ageRange,
  }) async {
    try {
      final querySnapshot = await _firestore.collection('users').get();
      final users = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      final matchedUsers = <Map<String, dynamic>>[];

      for (var user in users) {
        bool matches = true; // Assume the user matches until proven otherwise

        // Safely access fields and handle null values
        final normalizedName = (user['name'] as String?)?.trim() ?? '';
        final normalizedGender = (user['gender'] as String?)?.trim() ?? '';
        final normalizedJobPreferences =
            (user['job_preference'] as String?)?.trim() ?? '';
        final normalizedSkills = (user['skills'] as String?)?.trim() ?? '';
        final normalizedAgeRange = (user['age_range'] as String?)?.trim() ?? '';

        print('Evaluating user: ${user.toString()}');

        // Check name match
        if (name != null && !normalizedName.contains(name.trim())) {
          matches = false;
        }

        // Check gender match
        if (gender != null && !gender.contains(normalizedGender)) {
          matches = false;
        }

        // Check job preferences match
        if (jobPreferences != null &&
            !normalizedJobPreferences.contains(jobPreferences.trim())) {
          matches = false;
        }

        // Check skills match
        if (skills != null &&
            !skills.any((skill) => normalizedSkills.contains(skill.trim()))) {
          matches = false;
        }

        // Check age range match
        if (ageRange != null && normalizedAgeRange != ageRange.trim()) {
          matches = false;
        }

        if (matches) {
          matchedUsers.add(user);
        }
      }

      return matchedUsers;
    } catch (e) {
      print('Error during search: $e');
      return [];
    }
  }
}
