import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muser_ui/models/user.dart';
import 'package:muser_ui/managers/user_manager.dart';
import 'package:muser_ui/services/coming_soon.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  User user;
  String user_name = "";
  String user_city = "";
  String user_gender = "";

  @override
  void initState() {
    UserManager.getUserFromStorage().then((value) {
      setState(() {
        user = value;
        user_name = user.name;
        user_city = user.city;
        user_gender = user.gender;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double profileSize = size.width * (72 / 360) / 2;
    final double profileLeft = size.width * (30 / 360);

    // coming soon, delete after developed
    final double contentPositioner = size.height * (1 / 20);
    final String content =
        '慕斯我的账号正在测试，启用后将可以查看 收藏的音乐、指导、我的故事，以及可以更改个人账号信息，敬请期待！';

    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
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
                        backgroundImage: AssetImage(user_gender == 'm'
                            ? 'assets/avatar_male.png'
                            : user_gender == 'f'
                                ? 'assets/avatar_female.png'
                                : 'assets/avatar.png')),
                    SizedBox(width: profileLeft),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: <Widget>[
                                Text(user_name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(fontSize: 20)),
                                SizedBox(width: 5),
                                user_gender == 'm'
                                    ? Icon(FontAwesomeIcons.mars,
                                        color: Color(0xff4fa3c2), size: 20)
                                    : user_gender == 'f'
                                        ? Icon(FontAwesomeIcons.venus,
                                            color: Color(0xffff1744), size: 20)
                                        : SizedBox(width: 20)
                              ]),
                          SizedBox(height: 10),
                          Text(user_city,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(fontSize: 18)),
                        ])
                  ],
                ),
                SizedBox(height: 40),
                // Text(
                //   "收藏音乐",
                //   style: Theme.of(context)
                //             .textTheme
                //             .headline5
                //             .copyWith(fontSize: 18, fontWeight: FontWeight.bold)
                // )

                // coming soon, delete after developed
                Center(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: contentPositioner),
                    ComingSoon(passage: content, parentContext: context),
                  ],
                ))
              ])),
    ));
  }
}
