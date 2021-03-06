import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:muser_ui/routes/home.dart';
import 'package:muser_ui/routes/music_base.dart';
import 'package:muser_ui/routes/loader.dart';
import 'package:muser_ui/routes/signin.dart';
import 'package:muser_ui/routes/signup.dart';
import 'package:muser_ui/routes/setting.dart';
import 'package:muser_ui/routes/wechat_consent.dart';
import 'package:muser_ui/routes/signup_consent.dart';
import 'package:muser_ui/routes/forget_password.dart';
import 'package:muser_ui/routes/reset_password.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        primaryColorLight: Color(0xffa2ccdb),
        accentColor: Color(0xff4fa3c2),
        buttonColor: Color(0xffc7c7c7),
        textTheme: TextTheme(
            headline1: TextStyle(color: Color(0xff343434)),
            headline2: TextStyle(color: Color(0xff666666)),
            headline3: TextStyle(color: Color(0xffc7c7c7)),
            headline4: TextStyle(color: Color(0xffe8e8e8)),
            headline5: TextStyle(color: Color(0xff343434)),
            button: TextStyle(color: Colors.white, fontSize: 16))),
    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/musicBase': (context) => MusicBase(),
      '/': (context) => Loader(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/setting': (context) => Setting(),
      '/weChatConsent': (context) => WeChatConsent(),
      '/signUpConsent': (context) => SignUpConsent(),
      '/forgetPassword': (context) => ForgetPassword(),
      '/resetPassword': (context) => ResetPassword(),
    },
  ));
}
