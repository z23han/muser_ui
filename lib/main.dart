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
import 'package:muser_ui/routes/instruction/group/about_music1.dart';
import 'package:muser_ui/routes/instruction/group/about_music2.dart';
import 'package:muser_ui/routes/instruction/group/focus_training.dart';
import 'package:muser_ui/routes/instruction/group/focus_training01.dart';
import 'package:muser_ui/routes/instruction/group/focus_training02.dart';
import 'package:muser_ui/routes/instruction/group/focus_training03.dart';

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
      '/': (context) => Home(),
      '/musicBase': (context) => MusicBase(),
      '/loader': (context) => Loader(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/setting': (context) => Setting(),
      '/weChatConsent': (context) => WeChatConsent(),
      '/signUpConsent': (context) => SignUpConsent(),
      '/forgetPassword': (context) => ForgetPassword(),
      '/resetPassword': (context) => ResetPassword(),
      '/instruction/aboutMusic1': (context) => AboutMusic1(),
      '/instruction/aboutMusic2': (context) => AboutMusic2(),
      '/instruction/focusTraining': (context) => FocusTraining(),
      '/instruction/focusTraining01': (context) => FocusTraining01(),
      '/instruction/focusTraining02': (context) => FocusTraining02(),
      '/instruction/focusTraining03': (context) => FocusTraining03(),
    },
  ));
}
