import 'dart:async';
import 'package:flutter/material.dart';
import 'package:muser_ui/managers/user_manager.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  Timer _timer;

  void validateToken() async {
    var checker = await UserManager.validateToken();
    if (checker) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      Navigator.pushReplacementNamed(context, '/signin');
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = new Timer(const Duration(milliseconds: 5000), () {
      validateToken();
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
      )
    );
  }
}
