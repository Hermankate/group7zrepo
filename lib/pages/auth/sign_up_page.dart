// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cjb/pages/auth/names_page.dart';

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cjb/pages/auth/sign_in_page.dart';
// import 'package:cjb/theme/styles.dart';
// import 'package:cjb/widgets/button_container_widget.dart';

// import '../../widgets/google_button_container_widget.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   bool _isContinued = false;
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
//               // SizedBox(
//               //   height: 200,
//               // ),
//               Container(
//                   child: Center(
//                 child: Image(
//                   image: AssetImage("assets/logo.jpg"),
//                   width: 300,
//                   height: 300,
//                 ),
//               )),
//               // const SizedBox(
//               //   height: 10,

//               Center(
//                 child: Text(
//                   'Sign up.',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 35,
//                     color: cjb_blu,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 20, right: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: "Email or Phone",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     _isContinued == true
//                         ? TextFormField(
//                             decoration: const InputDecoration(
//                               hintText: "Password",
//                             ),
//                           )
//                         : Container(),
//                     _isContinued == true
//                         ? const SizedBox(
//                             height: 15,
//                           )
//                         : const SizedBox(height: 0),
//                     ButtonContainerWidget(
//                       title: "Continue",
//                       onTap: () {
//                         // You must also check if the email
//                         // is correctly formatted is not empty
//                         if (_isContinued == false) {
//                           setState(() {
//                             _isContinued = true;
//                           });
//                           return;
//                         }
//                         ;
//                         //Next operation
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(builder: (_) => Names_page()),
//                             (route) => false);
//                       },
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: SvgPicture.asset(
//                         "assets/google_logo_svg.svg",
//                         width: 30,
//                         height: 30,
//                       ),
//                       title: "Sign In with Google",
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: Icon(
//                         FontAwesomeIcons.apple,
//                         size: 22,
//                       ),
//                       title: "Sign In with Apple",
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                             text: "Have an account?",
//                             style: const TextStyle(
//                                 color: cjbBlack000000, fontSize: 16),
//                             children: [
//                               TextSpan(
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       Navigator.pushAndRemoveUntil(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (_) => SignInPage()),
//                                         (route) => false,
//                                       );
//                                     },
//                                   text: "Sign in",
//                                   style: const TextStyle(
//                                       color: cjb_blu,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16))
//                             ]),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cjb/pages/auth/auth_service.dart';
// import 'package:cjb/pages/auth/firebase_auth_services.dart';
// import 'package:cjb/pages/main/main_page/main_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cjb/pages/auth/sign_in_page.dart';
//  import 'package:cjb/pages/main/main_page/main_page.dart';
// import 'package:cjb/theme/styles.dart';
// import 'package:cjb/widgets/button_container_widget.dart';

// import '../../widgets/google_button_container_widget.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   bool _isContinued = false;
//   final FirebaseAuthServices _auth = FirebaseAuthServices();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

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
//               // SizedBox(
//               //   height: 200,
//               // ),
//               Container(
//                   child: Center(
//                 child: Image(
//                   image: AssetImage("assets/logo.jpg"),
//                   width: 300,
//                   height: 300,
//                 ),
//               )),
//               // const SizedBox(
//               //   height: 10,
//               // ),
//               Center(
//                 child: Text(
//                   'Sign up',
//                   style: TextStyle(fontSize: 35, color: cjbBlue0077B5),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 20, right: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         // const Text(
//                         //   "Join the Job Board",
//                         //   style: TextStyle(
//                         //       fontSize: 35, fontWeight: FontWeight.bold),
//                         // // ),
//                         // SizedBox(
//                         //   width: 10,
//                         // ),
//                         // ElevatedButton(
//                         //     onPressed: () {
//                         //       Navigator.pushAndRemoveUntil(
//                         //         context,
//                         //         MaterialPageRoute(
//                         //             builder: (_) => const OnBoardingScreen()),
//                         //         (route) => false,
//                         //       );
//                         //     },
//                         //     child: Text('back')),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         hintText: "Email or Phone",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       controller: _usernameController,
//                       decoration: const InputDecoration(
//                         hintText: "Username",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     _isContinued == true
//                         ? TextFormField(
//                             controller: _passwordController,
//                             decoration: const InputDecoration(
//                               hintText: "Password",
//                             ),
//                           )
//                         : Container(),
//                     _isContinued == true
//                         ? const SizedBox(
//                             height: 15,
//                           )
//                         : const SizedBox(height: 0),
//                     ButtonContainerWidget(
//                       title: "Continue",
//                       onTap: () {
//                         // You must also check if the email
//                         // is correctly formatted is not empty
//                         if (_isContinued == false) {
//                           setState(() {
//                             _isContinued = true;
//                             sigUp();
//                           });
//                           return;
//                         }
//                         //Next operation
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => MainPage(
//                                       firstName: '${_usernameController.text}',
//                                       first_Name: '${_usernameController.text}',
//                                     )),
//                             (route) => false);
//                       },
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: SvgPicture.asset(
//                         "assets/google_logo_svg.svg",
//                         width: 30,
//                         height: 30,
//                       ),
//                       title: "Sign In with Google",
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: Icon(
//                         FontAwesomeIcons.apple,
//                         size: 22,
//                       ),
//                       title: "Sign In with Apple",
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                             text: "Have an account?",
//                             style: const TextStyle(
//                                 color: cjbBlack000000, fontSize: 16),
//                             children: [
//                               TextSpan(
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       Navigator.pushAndRemoveUntil(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (_) => SignInPage()),
//                                         (route) => false,
//                                       );
//                                     },
//                                   text: "Sign in",
//                                   style: const TextStyle(
//                                       color: cjbBlue0077B5,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16))
//                             ]),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void sigUp() async {
//     String username = _usernameController.text;
//     String email = _emailController.text;
//     String password = _passwordController.text;
//     User? user = await _auth.signUpWithEmailAndPassword(email, password);
//     if (user != null) {
//       print('user created sucessfully');
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => SignInPage()),
//         (route) => false,
//       );
//     } else {
//       print('some error happende ');
//     }
//   }
// }

// import 'package:cjb/pages/auth/auth_service.dart';
// import 'package:cjb/pages/main/main_page/main_page.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cjb/pages/auth/sign_in_page.dart';
// import 'package:cjb/theme/styles.dart';
// import 'package:cjb/widgets/button_container_widget.dart';
// import 'package:cjb/widgets/google_button_container_widget.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final usernameController = TextEditingController();
//   bool _isContinued = false;

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
//                   height: 300,
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'Sign up.',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 35,
//                     color: cjb_blu,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       controller: emailController,
//                       decoration: const InputDecoration(
//                         hintText: "Email or Phone",
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       controller: usernameController,
//                       decoration: const InputDecoration(
//                         hintText: "Username",
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     _isContinued
//                         ? TextFormField(
//                             controller: passwordController,
//                             decoration: const InputDecoration(
//                               hintText: "Password",
//                             ),
//                           )
//                         : Container(),
//                     _isContinued ? SizedBox(height: 15) : SizedBox(height: 0),
//                     ButtonContainerWidget(
//                       title: "Continue",
//                       onTap: () async {
//                         if (_isContinued == false) {
//                           setState(() {
//                             _isContinued = true;
//                           });
//                           return;
//                         }

//                         // Call signupUser and await the result
//                         bool success = await AuthServices.signupUser(
//                           emailController.text,
//                           passwordController.text,
//                           usernameController.text,
//                           context,
//                         );

//                         if (success) {
//                           // If signup is successful, navigate to MainPage
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => MainPage(
//                                 firstName: usernameController.text,
//                                 first_Name: usernameController.text,
//                               ),
//                             ),
//                             (route) => false,
//                           );
//                         } else {
//                           // Clear the text fields or keep them for user to try again
//                           emailController.clear();
//                           passwordController.clear();
//                           usernameController.clear();
//                         }
//                       },
//                     ),
//                     SizedBox(height: 15),
//                     GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: SvgPicture.asset(
//                         "assets/google_logo_svg.svg",
//                         width: 30,
//                         height: 30,
//                       ),
//                       title: "Sign In with Google",
//                     ),
//                     SizedBox(height: 10),
//                     GoogleButtonContainerWidget(
//                       hasIcon: true,
//                       icon: Icon(
//                         FontAwesomeIcons.apple,
//                         size: 22,
//                       ),
//                       title: "Sign In with Apple",
//                     ),
//                     SizedBox(height: 30),
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                           text: "Have an account?",
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
//                                       builder: (_) => SignInPage(),
//                                     ),
//                                     (route) => false,
//                                   );
//                                 },
//                               text: "Sign in",
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
import 'package:cjb/pages/auth/auth_service.dart';
import 'package:cjb/pages/main/main_page/main_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cjb/pages/auth/sign_in_page.dart';
import 'package:cjb/theme/styles.dart';
import 'package:cjb/widgets/button_container_widget.dart';
import 'package:cjb/widgets/google_button_container_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool rememberMe = false;
  bool obscurePassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.fromLTRB(29, 102, 28, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(1.7, 0, 0, 11),
                child: Text(
                  'Create an Account',
                  style: GoogleFonts.getFont(
                    'DM Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Color(0xFF0D0140),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 1, 64),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'DM Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.6,
                    color: Color(0xFF524B6B),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 1, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full name',
                      style: GoogleFonts.getFont(
                        'DM Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xFF0D0140),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter your full name',
                        hintStyle: TextStyle(
                          color: Color(0x990D0140),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 1, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.getFont(
                        'DM Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xFF0D0140),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Color(0x990D0140),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(1, 0, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: GoogleFonts.getFont(
                        'DM Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xFF150B3D),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          color: Color(0x990D0140),
                          fontSize: 12,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 2.9, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: GoogleFonts.getFont(
                            'DM Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFFAAA6B9),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.getFont(
                        'DM Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF0D0140),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 2, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFF130160),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x2E99ABC6),
                      offset: Offset(0, 4),
                      blurRadius: 31,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () async {
                    // Call signupUser and await the result
                    bool success = await AuthServices.signupUser(
                      emailController.text,
                      passwordController.text,
                      fullNameController.text,
                      context,
                    );

                    if (success) {
                      // If signup is successful, navigate to MainPage
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MainPage(
                            firstName: fullNameController.text,
                            first_Name: fullNameController.text,
                          ),
                        ),
                        (route) => false,
                      );
                    } else {
                      // Clear the text fields or keep them for user to try again
                      emailController.clear();
                      passwordController.clear();
                      fullNameController.clear();
                    }
                  },
                  style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 17, horizontal: 100),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.getFont(
                      'DM Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.8,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 2, 16),
                decoration: BoxDecoration(
                  color: Color(0xFFD6CDFE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextButton(
                  onPressed: () {
                    // Implement Google sign-up functionality here
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/google_1.png',
                        width: 15.8,
                        height: 20,
                      ),
                      SizedBox(width: 10.4),
                      Text(
                        'SIGN UP WITH GOOGLE',
                        style: GoogleFonts.getFont(
                          'DM Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 0.8,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 2.9, 0),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF524B6B),
                    ),
                    children: [
                      TextSpan(
                        text: 'You don\'t have an account yet? ',
                        style: GoogleFonts.getFont(
                          'DM Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.getFont(
                          'DM Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          height: 1.3,
                          color: Color(0xFFFF9228),
                          decorationColor: Color(0xFFFF9228),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
