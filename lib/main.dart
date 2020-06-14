import 'package:flutter/material.dart';
import 'package:muser_ui/routes/home.dart';
import 'package:muser_ui/routes/loader.dart';
import 'package:muser_ui/routes/signin.dart';
import 'package:muser_ui/routes/signup.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey[400], accentColor: Colors.grey[800]),
    initialRoute: '/loader',
    routes: {
      '/': (context) => Home(),
      '/loader': (context) => Loader(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp()
    },
  ));
}
