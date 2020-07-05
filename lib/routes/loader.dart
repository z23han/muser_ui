import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

// access to global variables
GetIt getIt = GetIt.instance;

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  Timer _timer;
  String token;

  void getToken() {
    // Default value of non-existing key is null.
    getIt<FlutterSecureStorage>()
        .read(key: 'auth_token')
        .then((result) => token = result);
  }

  _LoaderState() {
    getToken();
    _timer = new Timer(const Duration(milliseconds: 5000), () {
      print(token);
      // TODO: implement a real validation
      if (token == null) {
        Navigator.pushReplacementNamed(context, '/signin');
      } else {
        Navigator.pushReplacementNamed(context, '/');
      }
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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: const FlutterLogo(style: FlutterLogoStyle.stacked),
          ),
        )),
        Padding(
          padding: EdgeInsets.all(28.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('你的专属音乐瑜伽',
                style: TextStyle(color: Colors.grey[500], fontSize: 20)),
          ),
        ),
      ],
    ));
  }
}
