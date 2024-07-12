// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  const Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 96, 243, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          'Next',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        )),
      ),
    );
  }
}
