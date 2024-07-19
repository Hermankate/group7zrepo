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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    // Handle login logic here
    print('Email: $email');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Login',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF150B3D),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Email',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(0xFF150B3D),
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
            Text(
              'Password',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(0xFF150B3D),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: _login,
              child: Container(
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                  color: Color(0xFFFF9228),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
