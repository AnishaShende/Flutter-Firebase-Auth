import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
// import 'main.dart';
import 'ForgotPasswordScreen.dart';
import 'SignUpScreen.dart';
import 'LoginFunctions.dart';
import 'DialogBuilder.dart';

class LoginScreen extends StatefulWidget {
  /// Simulates the multilanguage, you will implement your own logic.
  /// According to the current language, you can display a text message
  /// with the help of [LoginTexts] class.
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  LanguageOption language = _languageOptions[1];
  AuthMode currentMode = AuthMode.login;
  
  ///////////////////////////////////////
  // CancelableOperation? _operation;

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedLogin(
          onLogin: LoginFunctions(context).onLogin,
          onSignup: LoginFunctions(context).onSignup,
          ////////////////////////////////////////
          // onLogin: (LoginData data) async =>
          // _authOperation(LoginFunctions(context).onLogin(data)),
          // onSignup: (SignUpData data) async =>
          // _authOperation(LoginFunctions(context).onSignup(data)),
          
          onForgotPassword: LoginFunctions(context).onForgotPassword,
          logo: Image.asset('assets/images/splashScreen.JPG'),
          signUpMode: SignUpModes.both,
          socialLogins: _socialLogins(context),
          loginDesktopTheme: _desktopTheme,
          loginMobileTheme: _mobileTheme,
          loginTexts: _loginTexts,
          // emailController: _emailController,
          // passwordController: _passwordController,
          validateEmail: true,
          changeLanguageCallback: (LanguageOption? _language) {
            if (_language != null) {
              DialogBuilder(context).showResultDialog(
                  'Successfully changed the language to: ${_language.value}.');
              if (mounted) setState(() => language = _language);
            }
          },
          languageOptions: _languageOptions,
          selectedLanguage: language,
          initialMode: currentMode,
          onAuthModeChange: (AuthMode newMode) async {
            currentMode = newMode;
            // await _operation?.cancel();
          },
        ),
      ),
    );
  }

  static List<LanguageOption> get _languageOptions => const <LanguageOption>[
        LanguageOption(
          value: 'Hindi',
          code: 'HI',
          iconPath: 'assets/images/in.png',
        ),
        LanguageOption(
          value: 'English',
          code: 'EN',
          iconPath: 'assets/images/en.png',
        ),
      ];

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *DESKTOP* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
        // To set the color of button text, use foreground color.
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Color(0x33000000)),
        ),
        dialogTheme: const AnimatedDialogTheme(
          languageDialogTheme: LanguageDialogTheme(
              optionMargin: EdgeInsets.symmetric(horizontal: 80)),
        ),
      );

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *MOBILE* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _mobileTheme => LoginViewTheme(
        // showLabelTexts: false,
        backgroundColor:
            NeumorphicColors.background, // const Color(0xFF6666FF),
        hintTextStyle: TextStyle(color: NeumorphicColors.darkBackground),
        formFieldBackgroundColor: Color(0x33000000),
        borderColor: NeumorphicColors.darkBackground,
        socialHighlightColor: NeumorphicColors.darkBackground,
        fillColor: NeumorphicColors.darkBackground,
        textFormStyle: TextStyle(color: NeumorphicColors.darkBackground),
        formWidthRatio: 60,
        // actionButtonStyle: ButtonStyle(
        //   foregroundColor: MaterialStateProperty.all(Colors.blue),
        // ),
      );

  LoginTexts get _loginTexts => LoginTexts(
        welcome: _welcome,
        welcomeBack: _welcomeBack,
        notHaveAnAccount: _notHaveAnAccount,
        alreadyHaveAnAccount: _alreadyHaveAnAccount,
        welcomeBackDescription: _welcomeBackDescription,
        welcomeDescription: _welcomeDescription,
        loginEmailHint: _loginEmailHint,
        loginPasswordHint: _loginPasswordHint,
        signupEmailHint: _signupEmailHint,
        signupPasswordHint: _signupPasswordHint,
        confirmPasswordHint: _confirmPasswordHint,
        nameHint: _username,
        forgotPassword: _forgotPassword,
        loginUseEmail: _loginUseEmail,
        signUpUseEmail: _signUpUseEmail,
        login: _login,
        signUp: _signup,
      );

  /// You can adjust the texts in the screen according to the current language
  /// With the help of [LoginTexts], you can create a multilanguage scren.

  String get _welcome => language.code == 'HI' ? 'स्वागत है!' : 'Welcome!';

  String get _welcomeBack =>
      language.code == 'HI' ? 'वापसी पर स्वागत है!' : 'Welcome Back!';

  String get _welcomeBackDescription => language.code == 'HI'
      ? 'भगवद गीता ऐप में आपका फिर से स्वागत है'
      : 'Welcome back to the Bhagavad Gita app!';

  String get _welcomeDescription => language.code == 'HI'
      ? 'भगवद गीता ऐप में आपका स्वागत है'
      : 'Welcome to the Bhagavad Gita app!';

  String get _notHaveAnAccount =>
      language.code == 'HI' ? 'खाता नहीं है?' : 'Not have an account?';

  String get _alreadyHaveAnAccount => language.code == 'HI'
      ? 'पहले से एक खाता मौजूद है?'
      : 'Already have an account?';

  String get _loginEmailHint => language.code == 'HI' ? 'ईमेल' : 'Email';

  String get _forgotPassword =>
      language.code == 'HI' ? 'पासवर्ड भूल गए?' : 'Forgot Password?';

  String get _loginPasswordHint =>
      language.code == 'HI' ? 'पासवर्ड' : 'Password';

  String get _signupEmailHint => language.code == 'HI' ? 'ईमेल' : 'Email';

  String get _signupPasswordHint =>
      language.code == 'HI' ? 'पासवर्ड' : 'Password';

  String get _username => language.code == 'HI' ? 'नाम' : 'Username';

  String get _login => language.code == 'HI' ? 'लॉग इन करें' : 'Login';

  String get _signup => language.code == 'HI' ? 'साइन अप करें' : 'Sign Up';

  String get _confirmPasswordHint =>
      language.code == 'HI' ? 'पासवर्ड फिर से लिखें' : 'Confirm Password';

  String get _loginUseEmail => language.code == 'HI'
      ? 'या अपने ईमेल खाते का उपयोग करें'
      : 'or use your email account';

  String get _signUpUseEmail => language.code == 'HI'
      ? 'या ईमेल खाते का उपयोग करें'
      : 'or use your email for registration';

  /// Social login options, you should provide callback function and icon path.
  /// Icon paths should be the full path in the assets
  /// Don't forget to also add the icon folder to the "pubspec.yaml" file.
  List<SocialLogin> _socialLogins(BuildContext context) => <SocialLogin>[
        SocialLogin(
            callback: () async => LoginFunctions(context).socialLogin('Google'),
            iconPath: 'assets/images/google.png'),
        SocialLogin(
            callback: () async =>
                LoginFunctions(context).socialLogin('Facebook'),
            iconPath: 'assets/images/facebook.png'),
        SocialLogin(
            callback: () async =>
                LoginFunctions(context).socialLogin('Twitter'),
            iconPath: 'assets/images/twitter2.png'),
      ];
}

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
