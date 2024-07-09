// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cjb/components/my_button.dart';
import 'package:cjb/pages/main/main_page/main_page.dart';
import 'package:cjb/widgets/button_container_widget.dart';
import 'package:flutter/material.dart';

// class Preferences_page extends StatelessWidget {
//   const Preferences_page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Text("What would be your Job preferences?"),
//         SizedBox(
//           height: 20,
//         ),
//         //DropdownButtonFormField(items: [], onChanged: (value) )
//         Button(onTap: () {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (_) => const MainPage()),
//               (route) => false);
//         }),
//       ])),
//     );
//   }
// }
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedvalue = 'Information Tech(IT)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.all(10),
              height: 70,
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                dropdownColor: Colors.grey.shade200,
                isExpanded: true,
                value: selectedvalue,
                icon: Icon(Icons.arrow_circle_down_rounded),
                onChanged: (String? newvalue) {
                  setState(() {
                    selectedvalue = newvalue!;
                  });
                },
                items: <String>[
                  'Information Tech(IT)',
                  'Business',
                  'Educational',
                  'Tutors',
                  'Human Resource'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              )),
          Button(onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MainPage()),
                (route) => false);
          })
        ]),
      ),
    );
  }
}

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
