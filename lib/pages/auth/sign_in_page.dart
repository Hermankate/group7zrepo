// // // ignore_for_file: prefer_const_constructors

// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:cjb/pages/auth/sign_up_page.dart';
// // import 'package:cjb/pages/main/main_page/main_page.dart';
// // import 'package:cjb/theme/styles.dart';
// // import 'package:cjb/widgets/button_container_widget.dart';
// // import 'package:cjb/widgets/google_button_container_widget.dart';

// // class SignInPage extends StatelessWidget {
// //   SignInPage({Key? key}) : super(key: key);
// //   final emailcontroller = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: cjbWhiteFFFFFF,
// //       body: Container(
// //         color: cjbWhiteFFFFFF,
// //         margin: const EdgeInsets.only(top: 60),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Container(
// //                   child: Center(
// //                 child: Image(
// //                   image: AssetImage("assets/logo.jpg"),
// //                   width: 300,
// //                   height: 250,
// //                 ),
// //               )),
// //               Container(
// //                 margin: const EdgeInsets.only(left: 20, right: 20),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Center(
// //                       child: const Text(
// //                         "Sign in",
// //                         style: TextStyle(
// //                             color: cjb_blu,
// //                             fontSize: 40,
// //                             fontWeight: FontWeight.bold),
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                     ),
// //                     Center(
// //                       child: const Text(
// //                         "Stay updated on opportunities around campus",
// //                         style: TextStyle(fontSize: 14),
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                     ),
// //                     TextFormField(
// //                       controller: emailcontroller,
// //                       decoration: const InputDecoration(
// //                         hintText: "Email or Phone",
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                     ),
// //                     TextFormField(
// //                       decoration: const InputDecoration(
// //                         hintText: "Password",
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 15,
// //                     ),
// //                     const Text(
// //                       "Forgot password?",
// //                       style: TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.bold,
// //                           color: cjb_blu),
// //                     ),
// //                     const SizedBox(
// //                       height: 15,
// //                     ),
// //                     ButtonContainerWidget(
// //                       title: "Sign In",
// //                       onTap: () {
// //                         Navigator.pushAndRemoveUntil(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (_) => MainPage(
// //                                       firstName: emailcontroller.text,
// //                                       first_Name: '${emailcontroller.text}',
// //                                     )),
// //                             (route) => false);
// //                       },
// //                     ),
// //                     const SizedBox(
// //                       height: 15,
// //                     ),
// //                     Row(
// //                       children: [
// //                         Expanded(
// //                           child: Container(
// //                             width: double.infinity,
// //                             height: 1,
// //                             color: cjbMediumGrey86888A,
// //                           ),
// //                         ),
// //                         const Padding(
// //                           padding: EdgeInsets.symmetric(horizontal: 10.0),
// //                           child: Text("or"),
// //                         ),
// //                         Expanded(
// //                           child: Container(
// //                             width: double.infinity,
// //                             height: 1,
// //                             color: cjbMediumGrey86888A,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(
// //                       height: 15,
// //                     ),
// //                     GoogleButtonContainerWidget(
// //                       hasIcon: true,
// //                       icon: SvgPicture.asset(
// //                         "assets/google_logo_svg.svg",
// //                         width: 30,
// //                         height: 30,
// //                       ),
// //                       title: "Sign In with Google",
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                     ),
// //                     const GoogleButtonContainerWidget(
// //                       hasIcon: true,
// //                       icon: Icon(
// //                         FontAwesomeIcons.apple,
// //                         size: 22,
// //                       ),
// //                       title: "Sign In with Apple",
// //                     ),
// //                     const SizedBox(
// //                       height: 30,
// //                     ),
// //                     Center(
// //                       child: RichText(
// //                         text: TextSpan(
// //                             text: "New to cjb? ",
// //                             style: const TextStyle(
// //                                 color: cjbBlack000000, fontSize: 16),
// //                             children: [
// //                               TextSpan(
// //                                   recognizer: TapGestureRecognizer()
// //                                     ..onTap = () {
// //                                       Navigator.pushAndRemoveUntil(
// //                                         context,
// //                                         MaterialPageRoute(
// //                                             builder: (_) => const SignUpPage()),
// //                                         (route) => false,
// //                                       );
// //                                     },
// //                                   text: "Join now",
// //                                   style: const TextStyle(
// //                                       color: cjb_blu,
// //                                       fontWeight: FontWeight.bold,
// //                                       fontSize: 16))
// //                             ]),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cjb/pages/auth/auth_service.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cjb/pages/auth/sign_up_page.dart';
// import 'package:cjb/pages/main/main_page/main_page.dart';
// import 'package:cjb/theme/styles.dart';
// import 'package:cjb/widgets/button_container_widget.dart';
// import 'package:cjb/widgets/google_button_container_widget.dart';

// class SignInPage extends StatelessWidget {
//   SignInPage({Key? key}) : super(key: key);
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cjbWhiteFFFFFF,
//       body: Container(
//         color: cjbWhiteFFFFFF,
//         margin: const EdgeInsets.only(top: 60),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Image.asset(
//                   "assets/logo.jpg",
//                   width: 300,
//                   height: 250,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: const Text(
//                         "Sign in",
//                         style: TextStyle(
//                           color: cjb_blu,
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Center(
//                       child: const Text(
//                         "Stay updated on opportunities around campus",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       controller: emailController,
//                       decoration: const InputDecoration(
//                         hintText: "Email or Phone",
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       controller: passwordController,
//                       decoration: const InputDecoration(
//                         hintText: "Password",
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "Forgot password?",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: cjb_blu,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     ButtonContainerWidget(
//                       title: "Sign In",
//                       onTap: () {
//                         AuthServices.signinUser(
//                           emailController.text,
//                           passwordController.text,
//                           context,
//                         );
//                         Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => MainPage(
//                               firstName: emailController.text,
//                               first_Name: emailController.text,
//                             ),
//                           ),
//                           (route) => false,
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             width: double.infinity,
//                             height: 1,
//                             color: cjbMediumGrey86888A,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Text("or"),
//                         ),
//                         Expanded(
//                           child: Container(
//                             width: double.infinity,
//                             height: 1,
//                             color: cjbMediumGrey86888A,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: SvgPicture.asset(
//                         "assets/google_logo_svg.svg",
//                         width: 30,
//                         height: 30,
//                       ),
//                       title: "Sign In with Google",
//                     ),
//                     const SizedBox(height: 10),
//                     const GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: Icon(
//                         FontAwesomeIcons.apple,
//                         size: 22,
//                       ),
//                       title: "Sign In with Apple",
//                     ),
//                     const SizedBox(height: 30),
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                           text: "New to cjb? ",
//                           style: const TextStyle(
//                             color: cjbBlack000000,
//                             fontSize: 16,
//                           ),
//                           children: [
//                             TextSpan(
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.pushAndRemoveUntil(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (_) => const SignUpPage(),
//                                     ),
//                                     (route) => false,
//                                   );
//                                 },
//                               text: "Join now",
//                               style: const TextStyle(
//                                 color: cjb_blu,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cjb/pages/auth/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  void _toggleRememberMe(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    // Handle login logic here
    print('Email: $email');
    print('Password: $password');
  }

  void _loginWithGoogle() {
    // Handle Google login logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(29, 102, 20.9, 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Color(0xFF0D0140),
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.6,
                    color: Color(0xFF524B6B),
                  ),
                ),
                SizedBox(height: 64),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF0D0140),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF0D0140),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: _toggleRememberMe,
                        ),
                        Text(
                          'Remember me',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFFAAA6B9),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => ForgotPassword()),
                            (route) => false);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF0D0140),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 96, 243, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                SizedBox(height: 19),
                ElevatedButton.icon(
                  onPressed: _loginWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD6CDFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  icon: Image.asset(
                    'assets/images/google_1.png',
                    width: 24,
                    height: 24,
                  ),
                  label: Text(
                    'SIGN IN WITH GOOGLE',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF130160),
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF524B6B),
                    ),
                    children: [
                      TextSpan(
                        text: 'You don\'t have an account yet?  ',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          height: 1.3,
                          color: Color(0xFFFF9228),
                          decorationColor: Color(0xFFFF9228),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
