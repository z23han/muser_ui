import 'package:flutter/material.dart';
import 'package:muser_ui/routes/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey[400], accentColor: Colors.grey[800]),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
    },
  ));
}
