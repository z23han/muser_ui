import 'package:flutter/material.dart';
import 'dart:async';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  Timer _timer;

  _LoaderState() {
    _timer = new Timer(const Duration(milliseconds: 5000), () {
      Navigator.pushNamed(context, '/signin');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Loader'))
    );
  }
}