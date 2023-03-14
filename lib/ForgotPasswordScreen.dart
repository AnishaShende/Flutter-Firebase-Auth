// Created Forgot Password Screen
// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'main.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: NeumorphicColors.darkBackground,
      home: Scaffold(
        backgroundColor: NeumorphicColors.background,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: NeumorphicColors.background,
          child: Center(
            child: Text(
              "Forgot Password Page",
              style: TextStyle(
                  color: NeumorphicColors.darkBackground,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

/// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password after the verification.
  // Future<String?> onForgotPassword(String email) async {
  //   DialogBuilder(context).showLoadingDialog();
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.of(context).pop();
  //   Navigator.of(context).pushNamed('/forgotPass');
  //   // You should determine this path and create the screen.
  //   // Navigator.of(context).pushNamed('/forgotPass');
  //   return null;
  // }

  
// class DialogBuilder {
//   /// Builds various dialogs with different methods.
//   /// * e.g. [showLoadingDialog], [showResultDialog]
//   const DialogBuilder(this.context);
//   final BuildContext context;

//   /// Example loading dialog
//   Future<void> showLoadingDialog() => showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) => WillPopScope(
//           onWillPop: () async => false,
//           child: const AlertDialog(
//             content: SizedBox(
//               width: 100,
//               height: 100,
//               child: Center(
//                 child: CircularProgressIndicator(
//                   // color: Theme.of(context).primaryColor,
//                   color: NeumorphicColors.darkBackground,
//                   strokeWidth: 3,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );

//   /// Example result dialog
//   Future<void> showResultDialog(String text) => showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           content: SizedBox(
//             height: 100,
//             width: 100,
//             child: Center(child: Text(text, textAlign: TextAlign.center)),
//           ),
//         ),
//       );
// }
