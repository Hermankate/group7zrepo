// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cjb/pages/auth/names_page.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cjb/pages/auth/sign_in_page.dart';
import 'package:cjb/theme/styles.dart';
import 'package:cjb/widgets/button_container_widget.dart';

import '../../widgets/google_button_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isContinued = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cjbWhiteFFFFFF,
      body: Container(
        color: cjbWhiteFFFFFF,
        margin: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 200,
              // ),
              Container(
                  child: Center(
                child: Image(
                  image: AssetImage("assets/logo.jpg"),
                  width: 300,
                  height: 300,
                ),
              )),
              // const SizedBox(
              //   height: 10,

              Center(
                child: Text(
                  'Sign up.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: cjb_blu,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email or Phone",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _isContinued == true
                        ? TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Password",
                            ),
                          )
                        : Container(),
                    _isContinued == true
                        ? const SizedBox(
                            height: 15,
                          )
                        : const SizedBox(height: 0),
                    ButtonContainerWidget(
                      title: "Continue",
                      onTap: () {
                        // You must also check if the email
                        // is correctly formatted is not empty
                        if (_isContinued == false) {
                          setState(() {
                            _isContinued = true;
                          });
                          return;
                        }
                        ;
                        //Next operation
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => Names_page()),
                            (route) => false);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GoogleButtonContainerWidget(
                      hasIcon: true,
                      icon: SvgPicture.asset(
                        "assets/google_logo_svg.svg",
                        width: 30,
                        height: 30,
                      ),
                      title: "Sign In with Google",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const GoogleButtonContainerWidget(
                      hasIcon: true,
                      icon: Icon(
                        FontAwesomeIcons.apple,
                        size: 22,
                      ),
                      title: "Sign In with Apple",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Have an account?",
                            style: const TextStyle(
                                color: cjbBlack000000, fontSize: 16),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SignInPage()),
                                        (route) => false,
                                      );
                                    },
                                  text: "Sign in",
                                  style: const TextStyle(
                                      color: cjb_blu,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
