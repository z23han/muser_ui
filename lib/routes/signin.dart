import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Go to Sign Up'),
          onPressed: (){
            Navigator.pushNamed(context, '/signup');
          }
        )
      )
    );
  }
}