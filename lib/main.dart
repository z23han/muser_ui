import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:muser_ui/routes/home.dart';
import 'package:muser_ui/routes/music_base.dart';
import 'package:muser_ui/routes/loader.dart';
import 'package:muser_ui/routes/music_player.dart';
import 'package:muser_ui/routes/signin.dart';
import 'package:muser_ui/routes/signup.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.grey[400], accentColor: Colors.grey[800]),
    initialRoute: '/loader',
    routes: {
      '/': (context) => Home(),
      '/musicBase': (context) => MusicBase(),
      '/loader': (context) => Loader(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/musicPlayer': (context) => MusicPlayerScreen()
    },
  ));
}
