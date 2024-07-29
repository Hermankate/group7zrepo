import 'package:cjb/pages/main/main_page/employer/search_services.dart';
import 'package:flutter/material.dart';

class EmployeeSearchPage extends StatefulWidget {
  @override
  _EmployeeSearchPageState createState() => _EmployeeSearchPageState();
}

class _EmployeeSearchPageState extends State<EmployeeSearchPage> {
  final EmployeeSearchService _searchService = EmployeeSearchService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  // Other controllers...

  List<Map<String, dynamic>> _results = [];

  void _search() async {
    var results = await _searchService.searchEmployees(
      name: _nameController.text,
      location: _locationController.text,
      jobTitle: _jobTitleController.text,
      // Other fields...
    );
    setState(() {
      _results = results;
    });
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
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _jobTitleController,
              decoration: InputDecoration(labelText: 'Job Title'),
            ),
            // Other fields...
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
                    title: Text(profile['name']),
                    subtitle: Text(profile['jobTitle']),
                    // More profile info...
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
