// // ignore_for_file: prefer_const_constructors, use_super_parameters

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class MytextApp extends StatelessWidget {
//   MytextApp({Key? key}) : super(key: key );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: const TextField(
//         decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//           fillColor: Colors.grey,
//           filled: false,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MytextApp extends StatelessWidget {
  final TextEditingController controller;

  MytextApp({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.grey,
          filled: false,
        ),
      ),
    );
  }
}
