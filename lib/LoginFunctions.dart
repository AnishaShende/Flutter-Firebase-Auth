import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:pub_auth/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:pub_auth/LoginScreen.dart';
import 'LoginScreen.dart';
import 'DialogBuilder.dart';

class LoginFunctions {
  /// Collection of functions will be performed on login/signup.
  /// * e.g. [onLogin], [onSignup], [socialLogin], and [onForgotPassword]
  LoginFunctions(this.context);
  final BuildContext context;
  // final emailController = _emailController.text;
  // final passwordController = _passwordController.text;
  final _auth = FirebaseAuth.instance;
  // FirebaseUser loggedInUser;

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        // email: emailController,
        // password: passwordController,
        email: loginData.email,
        password: loginData.password,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        // wrongEmailMessage();
        DialogBuilder(context).showResultDialog('User not found!');
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        // wrongPasswordMessage();
        DialogBuilder(context).showResultDialog('Wrong password!');
        // await Future.delayed(const Duration(seconds: 2));
        // Navigator.of(context).pop();
      }
    }
    // FutureBuilder<FirebaseUser>(
    //   future: FirebaseAuth.instance.currentUser(),
    //   // initialData: InitialData,
    //   builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
    //     if (snapshot.hasData) {
    //       FirebaseUser user = snapshot.data; // this is your user instance
    //       /// is because there is user already logged
    //       return MainScreen();
    //     }
    //   },
    // );
    // if (FirebaseAuth.instance.currentUser != null) {
     DialogBuilder(context).showResultDialog('Successful login.');
    //    Navigator.pushNamed(context, '\HomePage');
    // }

    return null;
  }

  Future<String?> onForgotPassword(String email) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('/forgotPass');
    // You should determine this path and create the screen.
    // Navigator.of(context).pushNamed('/forgotPass');
    return null;
  }

  Future<String?> onSignup(SignUpData signupData) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    //////////////////////////
    // print(emailController);
    // print(passwordController);
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: signupData.email, password: signupData.password);
    // print(emailController);
    // print(passwordController);
    if (newUser != null) {
      Navigator.pushNamed(context, '\HomePage');
    }
    // final newUser = await _auth.createUserWithEmailAndPassword();
    DialogBuilder(context).showResultDialog('Successful sign up.');
    return null;
  }

  /// Social login callback example.
  Future<String?> socialLogin(String type) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilder(context)
        .showResultDialog('Successful social login with $type.');
    return null;
  }

  // Future<String?> _authOperation(Future<String?> func) async {
  //   await _operation?.cancel();
  //   _operation = CancelableOperation.fromFuture(func);
  //   final String? res = await _operation?.valueOrCancellation();
  //   if (_operation?.isCompleted == true) {
  //     DialogBuilder(context).showResultDialog(res ?? 'Successful.');
  //   }
  //   return res;
  // }
}
