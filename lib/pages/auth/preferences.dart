// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps, non_constant_identifier_names

// import 'package:cjb/components/my_button.dart';
// import 'package:cjb/pages/main/main_page/main_page.dart';

// import 'package:flutter/material.dart';

// class DropDownWidget extends StatefulWidget {
//   final String first_Name;

//   const DropDownWidget({required this.first_Name, Key? key}) : super(key: key);

//   @override
//   _DropDownWidgetState createState() => _DropDownWidgetState();
// }

// class _DropDownWidgetState extends State<DropDownWidget> {
//   String selectedvalue = 'Information Tech(IT)';

//   get first_Name => 'herman';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Preferences'),
//       ),
//       body: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Container(
//               margin: EdgeInsets.all(10),
//               height: 70,
//               // color: Colors.red,
//               width: MediaQuery.of(context).size.width,
//               child: DropdownButton<String>(
//                 dropdownColor: Colors.grey.shade200,
//                 isExpanded: true,
//                 value: selectedvalue,
//                 icon: Icon(Icons.arrow_circle_down_rounded),
//                 onChanged: (String? newvalue) {
//                   setState(() {
//                     selectedvalue = newvalue!;
//                   });
//                 },
//                 items: <String>[
//                   'Information Tech(IT)',
//                   'Business',
//                   'Educational',
//                   'Finance',
//                   'Human Resource'
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                       value: value, child: Text(value));
//                 }).toList(),
//               )),
//           Button(onTap: () {
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => MainPage(
//                           firstName: first_Name,
//                           first_Name: '${first_Name}',
//                         )),
//                 (route) => false);
//           })
//         ]),
//       ),
//     );
//   }
// }

// class DisplayPage extends StatelessWidget {
//   final String selectedValue;

//   const DisplayPage({Key? key, required this.selectedValue}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selected Value'),
//       ),
//       body: Center(
//         child: Text(
//           'Selected Value: $selectedValue',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
import 'package:cjb/pages/main/create/posts/firestore.dart';
import 'package:cjb/pages/main/notifications/push_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class JobSubscriptionScreen extends StatefulWidget {
  @override
  _JobSubscriptionScreenState createState() => _JobSubscriptionScreenState();
}

class _JobSubscriptionScreenState extends State<JobSubscriptionScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final PushNotificationService _pushNotificationService =
      PushNotificationService();
  final List<String> _categories = ['Tech', 'Finance', 'Health', 'Education'];
  List<String> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    _pushNotificationService.initialize();
    _loadUserSubscriptions();
  }

  Future<void> _loadUserSubscriptions() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      List<String> subscriptions =
          await _firestoreService.getUserSubscriptions(user.uid);
      setState(() {
        _selectedCategories = subscriptions;
      });
    }
  }

  void _onCategorySelected(bool selected, String category) {
    setState(() {
      if (selected) {
        _selectedCategories.add(category);
        _pushNotificationService.subscribeToCategory(category);
      } else {
        _selectedCategories.remove(category);
        _pushNotificationService.unsubscribeFromCategory(category);
      }
    });
  }

  Future<void> _saveUserSubscriptions() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _firestoreService.addUserSubscription(
          user.uid, _selectedCategories);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Subscriptions updated')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Job Categories')),
      body: ListView(
        children: _categories.map((category) {
          return CheckboxListTile(
            title: Text(category),
            value: _selectedCategories.contains(category),
            onChanged: (bool? selected) {
              if (selected != null) {
                _onCategorySelected(selected, category);
              }
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: _saveUserSubscriptions,
      ),
    );
  }
}
