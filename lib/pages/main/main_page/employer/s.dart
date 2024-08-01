import 'package:cjb/pages/main/main_page/employer/search_services.dart';
import 'package:flutter/material.dart';

class EmployeeSearchPage extends StatefulWidget {
  @override
  _EmployeeSearchPageState createState() => _EmployeeSearchPageState();
}

class _EmployeeSearchPageState extends State<EmployeeSearchPage> {
  final EmployeeSearchService _searchService = EmployeeSearchService();
  final TextEditingController _nameController = TextEditingController();
  //final TextEditingController _locationController = TextEditingController();
  final TextEditingController _jobPreferencesController =
      TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  // Other controllers...

  List<Map<String, dynamic>> _results = [];
  List<String> _selectedGenders = [];
  String _selectedAgeRange = '';
  void _search() async {
    if (_selectedGenders.isEmpty &&
        _selectedAgeRange.isEmpty &&
        _nameController.text.trim().isEmpty &&
        _jobPreferencesController.text.trim().isEmpty &&
        _skillsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter at least one search criteria')),
      );
      return;
    }

    print('Search criteria:');
    print('Name: ${_nameController.text.trim()}');
    print('Gender: $_selectedGenders');
    print('Job Preferences: ${_jobPreferencesController.text.trim()}');
    print('Skills: ${_skillsController.text.trim()}');
    print('Age Range: $_selectedAgeRange');

    var results = await _searchService.searchEmployees(
      name: _nameController.text.trim(),
      gender: _selectedGenders,
      jobPreferences: _jobPreferencesController.text.trim(),
      skills: _skillsController.text.trim().split(','),
      ageRange: _selectedAgeRange,
    );

    setState(() {
      _results = results;
    });
  }

  void _selectAgeRange() async {
    String? ageRange = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text('20-35'),
                onTap: () => Navigator.pop(context, '20-35'),
              ),
              ListTile(
                title: Text('35-50'),
                onTap: () => Navigator.pop(context, '35-50'),
              ),
            ],
          ),
        );
      },
    );

    if (ageRange != null) {
      setState(() {
        _selectedAgeRange = ageRange;
      });
    }
  }

  void _selectGenders() async {
    List<String>? selectedGenders = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        List<String> selected = List.from(_selectedGenders);
        return AlertDialog(
          title: Text('Select Gender(s)'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: Text('Male'),
                value: selected.contains('Male'),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selected.add('Male');
                    } else {
                      selected.remove('Male');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Female'),
                value: selected.contains('Female'),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selected.add('Female');
                    } else {
                      selected.remove('Female');
                    }
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, selected),
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    if (selectedGenders != null) {
      setState(() {
        _selectedGenders = selectedGenders;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Employees'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _jobPreferencesController,
              decoration: InputDecoration(labelText: 'Job Preferences'),
            ),
            TextField(
              controller: _skillsController,
              decoration:
                  InputDecoration(labelText: 'Skills (comma-separated)'),
            ),
            ListTile(
              title: Text('Age Range: $_selectedAgeRange'),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: _selectAgeRange,
            ),
            ListTile(
              title: Text('Gender(s): ${_selectedGenders.join(', ')}'),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: _selectGenders,
            ),
            ElevatedButton(
              onPressed: _search,
              child: Text('Search'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  var profile = _results[index];
                  return ListTile(
                    leading: profile['image_path'] != null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(profile['image_path']),
                          )
                        : CircleAvatar(child: Icon(Icons.person)),
                    title: Text(profile['name'] ?? 'No name'),
                    subtitle: Text(profile['email'] ?? 'No email'),
                    onTap: () {
                      // Handle tap event if needed
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
