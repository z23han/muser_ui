import 'package:flutter/material.dart';
import 'package:muser_ui/routes/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
    },
  ));
}
