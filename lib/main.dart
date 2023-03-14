import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'LoginScreen.dart';
import 'ForgotPasswordScreen.dart';
import 'auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: NeumorphicColors.darkBackground,
      title: 'Login Screen',
      theme: ThemeData(

        // textTheme: Theme.of(context).textTheme.apply(bodyColor: NeumorphicColors.darkBackground),
        primaryColor: NeumorphicColors.darkBackground,
        
        hintColor: Colors.redAccent,
      ),
      // debugShowCheckedModeBanner: false,
      // debugShowCheckedModeBanner: false,
      // initialRoute: '/login',
      // routes: {
      //   '/login': (BuildContext context) => const LoginScreen(),
      //   '/forgotPass': (BuildContext context) => const ForgotPasswordScreen(),
      // },
      home: AuthPage(),
    );
  }


  // /// Sign up action that will be performed on click to action button in sign up mode.
  // Future<String?> onSignup(SignUpData signupData) async {
  //   DialogBuilder(context).showLoadingDialog();
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.of(context).pop();
  //   DialogBuilder(context).showResultDialog('Successful sign up.');
  //   return null;
  // }

  // /// Social login callback example.
  // Future<String?> socialLogin(String type) async {
  //   DialogBuilder(context).showLoadingDialog();
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.of(context).pop();
  //   DialogBuilder(context)
  //       .showResultDialog('Successful social login with $type.');
  //   return null;
  // }

}

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

// class LoginFunctions {
//   /// Collection of functions will be performed on login/signup.
//   /// * e.g. [onLogin], [onSignup], [socialLogin], and [onForgotPassword]
//   const LoginFunctions(this.context);
//   final BuildContext context;

//   /// Login action that will be performed on click to action button in login mode.
//   Future<String?> onLogin(LoginData loginData) async {
//     DialogBuilder(context).showLoadingDialog();
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.of(context).pop();
//     DialogBuilder(context).showResultDialog('Successful login.');
//     return null;
//   }

//   Future<String?> onForgotPassword(String email) async {
//     DialogBuilder(context).showLoadingDialog();
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.of(context).pop();
//     Navigator.of(context).pushNamed('/forgotPass');
//     // You should determine this path and create the screen.
//     // Navigator.of(context).pushNamed('/forgotPass');
//     return null;
//   }

//   Future<String?> onSignup(SignUpData signupData) async {
//     DialogBuilder(context).showLoadingDialog();
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.of(context).pop();
//     DialogBuilder(context).showResultDialog('Successful sign up.');
//     return null;
//   }

//   /// Social login callback example.
//   Future<String?> socialLogin(String type) async {
//     DialogBuilder(context).showLoadingDialog();
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.of(context).pop();
//     DialogBuilder(context)
//         .showResultDialog('Successful social login with $type.');
//     return null;
//   }
// }

