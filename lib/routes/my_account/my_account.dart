import 'package:flutter/material.dart';
import 'package:muser_ui/models/user.dart';
import 'package:muser_ui/managers/user_manager.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  User user;
  String user_name = "";
  String user_city = "";

  @override
  void initState() {
    UserManager.getUserFromStorage().then((value) {
      setState(() {
        user = value;
        user_name = user.name;
        user_city = user.city;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double profileSize = size.width * ( 72 / 360) / 2;
    final double profileLeft = size.width * ( 30 / 360);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: profileSize,
                  backgroundImage: AssetImage('assets/avatar.png')
                ),
                SizedBox(width: profileLeft),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user_name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 20)
                    ),
                    SizedBox(height: 10),
                    Text(
                      user_city,
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 18)
                    ),
                  ] 
                )
              ],
            ),
            SizedBox(height: 40),
            Text(
              "收藏音乐",
              style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold)
            )
          ]
        )
      )
    );
  }
}
