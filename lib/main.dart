import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:muser_ui/routes/home.dart';
import 'package:muser_ui/routes/loader.dart';
import 'package:muser_ui/routes/music_player.dart';
import 'package:muser_ui/routes/signin.dart';
import 'package:muser_ui/routes/signup.dart';
import 'package:muser_ui/routes/wechat_consent.dart';
import 'package:muser_ui/routes/signup_consent.dart';
import 'package:muser_ui/routes/forget_password.dart';
import 'package:muser_ui/routes/reset_password.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey[400], accentColor: Colors.grey[800]),
    initialRoute: '/forgetPassword',
    routes: {
      '/': (context) => Home(),
      '/loader': (context) => Loader(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/musicPlayer': (context) => MusicPlayerScreen(),
      '/weChatConsent': (context) => WeChatConsent(),
      '/signUpConsent': (context) => SignUpConsent(),
      '/forgetPassword': (context) => ForgetPassword(),
      '/resetPassword': (context) => ResetPassword(),
    },
  ));
}
