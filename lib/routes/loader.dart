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

  @override
  void initState() {
    super.initState();
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

  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double logoWidth = size.width * (190 / 360);
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * (200 / 640)),
          Image(image: AssetImage('assets/Muser_Logo.png'), width: logoWidth),
          Spacer(flex: 1),
          Text('慕斯，你的专属音乐瑜伽',
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 18)),
          SizedBox(height: size.height * (40 / 640)),
        ],
      ),
    ));
  }
}
