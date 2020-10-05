import 'package:flutter/material.dart';
import 'package:muser_ui/managers/user_manager.dart';
import 'package:muser_ui/utils/config.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final bool guestMode = Config.guestMode;

  Future<void> login(BuildContext context) async {

    var username = _usernameController.text.trim();

    var password = _passwordController.text;

    print('username: $username, password: $password');

    var checker = false;

    if (guestMode) {
      checker = await UserManager.guestLogin(username, password);
    } else {
      checker = await UserManager.login(username, password);
    }

    if (checker) {
      
      Navigator.pushReplacementNamed(context, '/home');

    } else {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('您输入的账号或密码错误'),
            content: const Text('请重新尝试'),
            actions: <Widget>[
              FlatButton(
                child: Text('再试一次'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double safePadding = MediaQuery.of(context).padding.top;
    final double flexTop = size.height * (30 / 640);
    final double arrowSize = size.width * (34 / 360);
    // final double otherIconSize = size.width * (30 / 360);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_signin.png'), fit: BoxFit.cover)),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(padding: EdgeInsets.all(0), children: [
            SizedBox(height: safePadding),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: GestureDetector(
                  //     onTap: () {},
                  //     child: Text('English',
                  //         style:
                  //             TextStyle(color: Colors.grey[500], fontSize: 14)),
                  //   ),
                  // ),
                  // GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushReplacementNamed(context, '/home');
                  //     },
                  //     child: Text('跳过',
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .headline3
                  //             .copyWith(fontSize: 16)))
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            SizedBox(height: flexTop),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('开启你的\n音乐瑜伽\n之旅',
                              style: Theme.of(context).textTheme.headline2))),
                  Spacer(flex: 1),
                ]),
            SizedBox(height: 20),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.person_outline,
                          color: Theme.of(context).accentColor, size: 32)),
                  Text('账号',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 16)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        height: 20,
                        child: VerticalDivider(
                            color: Color(0xff666666), width: 0, thickness: 1)),
                  ),
                  Expanded(
                      child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: '用户名/手机号',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ))
                ]),
            Divider(
              color: Color(0xffc7c7c7),
              height: 0,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 30),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.lock_outline,
                          color: Theme.of(context).accentColor, size: 32)),
                  Text('密码',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 16)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        height: 20,
                        child: VerticalDivider(
                            color: Color(0xff666666), width: 0, thickness: 1)),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '******',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ]),
            Divider(
              color: Color(0xffc7c7c7),
              height: 0,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              GestureDetector(
                  onTap: () {
                    login(context);
                  },
                  child: Image(
                    image: AssetImage('assets/arrow_right.png'),
                    width: arrowSize,
                    height: arrowSize,
                  ))
            ]),

            //TODO: replace wechat and qq icons with 50px height sizedbox since the functionality is not implemeted
            SizedBox(height: 50),
            // Text('其他登陆方式',
            //     style: Theme.of(context)
            //         .textTheme
            //         .headline3
            //         .copyWith(fontSize: 14)),
            // SizedBox(height: 5),
            // Row(
            //   children: <Widget>[
            //     Padding(
            //         padding: EdgeInsets.only(right: 10),
            //         child: InkWell(
            //           onTap: () {},
            //           child: Image(
            //             image: AssetImage('assets/signin_logo_wechat.png'),
            //             width: otherIconSize,
            //             height: otherIconSize,
            //           ),
            //         )),
            //     Padding(
            //         padding: EdgeInsets.only(right: 10),
            //         child: InkWell(
            //           onTap: () {},
            //           child: Image(
            //             image: AssetImage('assets/signin_logo_qq.png'),
            //             width: otherIconSize,
            //             height: otherIconSize,
            //           ),
            //         )),
            //   ],
            // ),

            SizedBox(height: 30),
            Row(children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (guestMode) {
                    print('do nothing for guestMode');
                  } else {
                    Navigator.pushNamed(context, '/signUpConsent');
                  }
                },
                child: Text('我要注册',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontSize: 14)),
              ),

              //TODO: implement forgot password functionality
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15),
              //   child: Container(
              //       height: 15,
              //       child: VerticalDivider(
              //           color: Color(0xffc7c7c7), width: 0, thickness: 1)),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(context, '/forgetPassword');
              //   },
              //   child: Text('忘记密码',
              //       style: Theme.of(context)
              //           .textTheme
              //           .headline3
              //           .copyWith(fontSize: 14)),
              // ),
            ])
          ])),
    ));
  }
}
